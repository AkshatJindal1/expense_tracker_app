import 'package:drift/drift.dart' as drift;
import 'package:expense_tracker_app/core/models/transaction_with_everything.dart';
import 'package:expense_tracker_app/db/app_database.dart';
import 'package:expense_tracker_app/db/providers.dart';
import 'package:expense_tracker_app/core/models/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {

  final TransactionWithEverything? existing;

  const AddTransactionScreen({super.key, this.existing});

  @override
  ConsumerState<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _SplitFormEntry {
  final TextEditingController amountController = TextEditingController();
  PaidFor paidFor = PaidFor.self;
  String? personId;
  bool isSplitwise = false;

  bool _hasListner = false;
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _uuid = const Uuid();

  String? _selectedSourceId;
  TransactionType _transactionType = TransactionType.expense;
  String? _category;
  List<_SplitFormEntry> _splits = [];

  @override
  void initState() {
    super.initState();

    if (widget.existing != null) {
      final txn = widget.existing!.txn;

      _amountController.text = txn.amount.toString();
      _selectedSourceId = txn.sourceId;
      _transactionType = TransactionType.values.byName(txn.transactionType);
      _category = txn.category;

      _splits = widget.existing!.splits.map((s) {
        final entry = _SplitFormEntry()
          ..amountController.text = s.split.amount.toString()
          ..paidFor = PaidFor.values.byName(s.split.paidFor)
          ..personId = s.split.personId
          ..isSplitwise = s.split.isSplitwise;

          return entry;
      }).toList();
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


  @override
  Widget build(BuildContext context) {
    final db = ref.watch(appDatabaseProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Add Transaction')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Amount
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Amount'),
                validator: (val) => val == null || val.isEmpty ? 'Enter amount' : null,
              ),

              const SizedBox(height: 12),

              // Transaction type
              DropdownButtonFormField<TransactionType>(
                value: _transactionType,
                items: TransactionType.values.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type.label),
                  );
                }).toList(),
                onChanged: (val) => setState(() => _transactionType = val!),
                decoration: const InputDecoration(labelText: 'Transaction Type'),
              ),

              const SizedBox(height: 12),

              // Source
              FutureBuilder<List<Source>>(
                future: db.select(db.sources).get(),
                builder: (context, snapshot) {
                  final sources = snapshot.data ?? [];
                  return DropdownButtonFormField<String>(
                    value: _selectedSourceId,
                    items: sources
                        .map((s) => DropdownMenuItem(value: s.id, child: Text(s.name)))
                        .toList(),
                    onChanged: (val) => setState(() => _selectedSourceId = val),
                    decoration: const InputDecoration(labelText: 'Source'),
                  );
                },
              ),

              const SizedBox(height: 12),

              // Category
              TextFormField(
                decoration: const InputDecoration(labelText: 'Category'),
                onChanged: (val) => _category = val,
              ),

              const SizedBox(height: 24),
              Text('Split Expense', style: Theme.of(context).textTheme.titleMedium),

              const SizedBox(height: 8),
              ..._splits.asMap().entries.map((entry) {
                final index = entry.key;
                final split = entry.value;
                if (!split._hasListner) {
                  split.amountController.addListener(() => setState(() {}));
                  split._hasListner = true;
                }
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Split ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
                            TextFormField(
                              controller: split.amountController,
                              decoration: const InputDecoration(labelText: 'Amount'),
                              keyboardType: TextInputType.number,
                              validator: (val) => val == null || val.isEmpty ? 'Enter amount' : null,
                            ),

                            DropdownButtonFormField<PaidFor>(
                              value: split.paidFor,
                              decoration: const InputDecoration(labelText: 'Paid For'),
                              items: PaidFor.values.map((pf) {
                                return DropdownMenuItem(value: pf, child: Text(pf.label));
                              }).toList(),
                              onChanged: (val) {
                                setState(() => split.paidFor = val!);
                              },
                            ),

                            // Person picker (only when someoneElse)
                            if (split.paidFor == PaidFor.someoneElse)
                              FutureBuilder(
                                future: ref.read(appDatabaseProvider).select(ref.read(appDatabaseProvider).persons).get(),
                                builder: (context, snapshot) {
                                  final people = snapshot.data ?? [];
                                  return DropdownButtonFormField<String>(
                                    value: split.personId,
                                    decoration: const InputDecoration(labelText: 'Person'),
                                    items: people
                                        .map((p) => DropdownMenuItem(value: p.id, child: Text(p.name)))
                                        .toList(),
                                    onChanged: (val) {
                                      setState(() => split.personId = val);
                                    },
                                  );
                                },
                              ),

                            CheckboxListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('On Splitwise'),
                              value: split.isSplitwise,
                              onChanged: (val) => setState(() => split.isSplitwise = val ?? false),
                            ),
                          ],
                        ),
                      ),
                      // Delete button.
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.close, size: 20),
                          tooltip: 'Remove Split',
                          onPressed: () {
                            setState(() {
                              _splits.removeAt(index);
                            });
                          },
                        )
                      )
                    ],
                  )
                );
              }),
              if (_splits.isNotEmpty)
                Text(
                  'Split Total: ₹${_splitTotal.toStringAsFixed(2)} / ₹${_amountController.text}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _splitTotalMismatch ? Colors.red : Colors.green,
                  ),
                ),
              
              TextButton.icon(
                onPressed: () {
                  setState(() => _splits.add(_SplitFormEntry()));
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Split'),
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate() && _selectedSourceId != null) {
                    final isEdit = widget.existing != null;
                    final txnId = isEdit ? widget.existing!.txn.id : _uuid.v4();
                    final db = ref.read(appDatabaseProvider);
                    final txn = TransactionsCompanion(
                      id: drift.Value(txnId),
                      transactionType: drift.Value(_transactionType.name),
                      amount: drift.Value(double.parse(_amountController.text)),
                      sourceId: drift.Value(_selectedSourceId!),
                      timestamp: drift.Value(DateTime.now()),
                      category: drift.Value(_category ?? 'General'),
                    );

                    final totalAmount = double.tryParse(_amountController.text) ?? 0;
                    if (_splits.isEmpty) {
                      _splits.add(_SplitFormEntry()
                        ..paidFor = PaidFor.self
                        ..amountController.text = totalAmount.toStringAsFixed(2));
                    }

                    if (_splitTotalMismatch) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Split total does not match transaction amount')),
                      );
                      return;
                    }

                    final splitCompanions = _splits.map((s) {
                      return SplitItemsCompanion(
                        id: drift.Value(_uuid.v4()),
                        transactionId: drift.Value(txnId),
                        amount: drift.Value(double.tryParse(s.amountController.text) ?? 0),
                        paidFor: drift.Value(s.paidFor.name),
                        personId: drift.Value(s.personId),
                        isSplitwise: drift.Value(s.isSplitwise),
                      );
                    }).toList();

                    if (isEdit) {
                      await db.transactionDao.updateTransactionWithSplits(txn, splitCompanions);
                    } else {
                      await ref.read(appDatabaseProvider).transactionDao.insertTransactionWithSplits(txn, splitCompanions);
                    }
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
