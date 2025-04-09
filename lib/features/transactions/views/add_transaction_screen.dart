import 'package:drift/drift.dart' as drift;
import 'package:expense_tracker_app/core/models/transaction_with_everything.dart';
import 'package:expense_tracker_app/db/app_database.dart';
import 'package:expense_tracker_app/db/providers.dart';
import 'package:expense_tracker_app/core/models/enums.dart';
import 'package:expense_tracker_app/features/transactions/widgets/fee_section.dart';
import 'package:expense_tracker_app/features/transactions/widgets/split_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../widgets/amount_input.dart';
import '../widgets/transaction_type_dropdown.dart';
import '../widgets/source_dropdown.dart';
import '../widgets/category_dropdown.dart';
import '../widgets/destination_dropdown.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {
  final TransactionType? defaultType;
  final TransactionWithEverything? existing;

  const AddTransactionScreen({super.key, this.existing, this.defaultType});

  @override
  ConsumerState<AddTransactionScreen> createState() =>
      _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _feeController = TextEditingController();
  final _uuid = const Uuid();

  String? _selectedSourceId;
  String? _selectedToSourceId;
  String? _selectedFeeSourceId;
  TransactionType _transactionType = TransactionType.expense;
  String? _category;
  List<SplitFormEntry> _splits = [];

  bool _feeSourceManuallySelected = false;

  @override
  void initState() {
    super.initState();

    if (widget.existing != null) {
      final txn = widget.existing!.txn;

      _amountController.text = txn.amount.toString();
      _selectedSourceId = txn.sourceId;
      _transactionType = TransactionType.values.byName(txn.transactionType);
      _category = txn.category;

      _splits =
          widget.existing!.splits.map((s) {
            final entry =
                SplitFormEntry()
                  ..amountController.text = s.split.amount.toString()
                  ..paidFor = PaidFor.values.byName(s.split.paidFor)
                  ..personId = s.split.personId
                  ..isSplitwise = s.split.isSplitwise;

            return entry;
          }).toList();
    } else {
      _transactionType = widget.defaultType ?? TransactionType.expense;
    }

    _amountController.addListener(() => setState(() {}));
  }

  double get _splitTotal {
    return _splits.fold(0.0, (sum, entry) {
      return sum + (double.tryParse(entry.amountController.text) ?? 0);
    });
  }

  bool get _splitTotalMismatch {
    final txnAmount = double.tryParse(_amountController.text) ?? 0;
    return (_splitTotal - txnAmount).abs() > 0.01;
  }

  void _addTransaction() async {
    if (_formKey.currentState!.validate() && _selectedSourceId != null) {
      final isEdit = widget.existing != null;
      final txnId = isEdit ? widget.existing!.txn.id : _uuid.v4();
      final db = ref.read(appDatabaseProvider);
      final txn = TransactionsCompanion(
        id: drift.Value(txnId),
        transactionType: drift.Value(_transactionType.name),
        amount: drift.Value(double.parse(_amountController.text)),
        sourceId: drift.Value(_selectedSourceId!),
        toSourceId:
            _transactionType == TransactionType.transfer
                ? drift.Value(_selectedSourceId!)
                : const drift.Value.absent(),
        fee:
            _transactionType == TransactionType.transfer &&
                    _feeController.text.isNotEmpty
                ? drift.Value(double.parse(_feeController.text))
                : const drift.Value.absent(),
        feeSourceId:
            _transactionType == TransactionType.transfer &&
                    _feeController.text.isNotEmpty
                ? drift.Value(_selectedFeeSourceId!)
                : const drift.Value.absent(),
        timestamp: drift.Value(DateTime.now()),
        category: drift.Value(_category ?? 'General'),
      );

      final totalAmount = double.tryParse(_amountController.text) ?? 0;
      if (_splits.isEmpty) {
        _splits.add(
          SplitFormEntry()
            ..paidFor = PaidFor.self
            ..amountController.text = totalAmount.toStringAsFixed(2),
        );
      }

      if (_splitTotalMismatch) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Split total does not match transaction amount'),
          ),
        );
        return;
      }

      final splitCompanions =
          _transactionType == TransactionType.transfer
              ? <SplitItemsCompanion>[]
              : _splits.map((s) {
                return SplitItemsCompanion(
                  transactionId: drift.Value(txnId),
                  amount: drift.Value(
                    double.tryParse(s.amountController.text) ?? 0,
                  ),
                  paidFor: drift.Value(s.paidFor.name),
                  personId: drift.Value(s.personId),
                  isSplitwise: drift.Value(s.isSplitwise),
                );
              }).toList();

      if (isEdit) {
        await db.transactionDao.updateTransactionWithSplits(
          txn,
          splitCompanions,
        );
      } else {
        await ref
            .read(appDatabaseProvider)
            .transactionDao
            .insertTransactionWithSplits(txn, splitCompanions);
      }
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Transaction')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              AmountInput(controller: _amountController),

              TransactionTypeDropdown(
                value: _transactionType,
                onChanged: (val) => setState(() => _transactionType = val!),
              ),

              // Source
              SourceDropdown(
                selectedSourceId: _selectedSourceId,
                onChanged: (val) => setState(() => _selectedSourceId = val),
              ),

              if (_transactionType == TransactionType.transfer) ...[
                DestinationDropdown(
                  selectedToSourceId: _selectedToSourceId,
                  excludeSourceId: _selectedSourceId,
                  onChanged: (val) => setState(() => _selectedToSourceId = val),
                ),

                FeeSection(
                  feeController: _feeController,
                  selectedFeeSourceId: _selectedFeeSourceId,
                  onChanged:
                      (val) => setState(() {
                        _feeSourceManuallySelected = true;
                        _selectedFeeSourceId = val;
                      }),
                ),
              ],

              // Category
              TextFormField(
                decoration: const InputDecoration(labelText: 'Category'),
                onChanged: (val) => _category = val,
              ),

              if (_transactionType == TransactionType.expense)
                SplitSection(
                  splits: _splits,
                  onAddSplit:
                      () => setState(() => _splits.add(SplitFormEntry())),
                  onRemoveSplit: (i) => setState(() => _splits.removeAt(i)),
                  triggerUpdate: () => setState(() {}),
                  totalExpenseController: _amountController,
                ),

              ElevatedButton(
                onPressed: _addTransaction,
                child: const Text('Add Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
