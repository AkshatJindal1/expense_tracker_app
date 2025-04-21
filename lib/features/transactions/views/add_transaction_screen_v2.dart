// ignore_for_file: use_build_context_synchronously

import 'package:expense_tracker_app/core/models/enums.dart';
import 'package:expense_tracker_app/core/models/source_with_everything.dart';
import 'package:expense_tracker_app/core/models/transaction_with_everything.dart';
import 'package:expense_tracker_app/db/app_database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:expense_tracker_app/db/providers.dart';
import 'package:expense_tracker_app/features/transactions/providers/source_provider.dart';
import 'package:expense_tracker_app/features/transactions/providers/transactions_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class AddTransactionV2Screen extends ConsumerStatefulWidget {
  final TransactionWithEverything? existing;
  const AddTransactionV2Screen({super.key, this.existing});

  @override
  ConsumerState<AddTransactionV2Screen> createState() =>
      _AddTransactionV2ScreenState();
}

class _AddTransactionV2ScreenState
    extends ConsumerState<AddTransactionV2Screen> {
  // final _transactionTypeIcons = {
  //   TransactionType.expense: Icons.remove_circle_outline,
  //   TransactionType.income: Icons.add_circle_outline,
  //   TransactionType.transfer: Icons.swap_horiz,
  //   TransactionType.investment: Icons.trending_up,
  //   TransactionType.adjustment: Icons.build,
  // };

  final _uuid = const Uuid();
  String _transactionTypeId = 'expense';
  TransactionType? _transcationType;
  // IconData _selectTypeIcon = Icons.remove_circle_outline;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  final TextEditingController _amountController = TextEditingController();
  SourceWithEverything? _selectedSource;
  TransactionCategory? _selectedTxnCat;

  final List<_SplitEntry> _splits = [];

  double get _splitTotal => _splits.fold(
    0.0,
    (sum, s) => sum + (double.tryParse(s.amountController.text) ?? 0),
  );
  bool get _splitTotalMismatch {
    final total = double.tryParse(_amountController.text) ?? 0;
    return (total - _splitTotal).abs() > 0.01;
  }

  @override
  void initState() {
    super.initState();
    final existing = widget.existing;
    if (existing != null) {
      final txn = existing.txn;
      _amountController.text = txn.amount.toString();
      _selectedSource = existing.source;
      _selectedDate = txn.timestamp;
      _selectedTime = TimeOfDay.fromDateTime(txn.timestamp);
      _transactionTypeId = existing.transactionType!.id;
      // _transcationType = TransactionType.values.byName(txn.transactionType);

      for (final s in existing.splits) {
        final entry =
            _SplitEntry()
              ..amountController.text = s.split.amount.toString()
              ..paidFor = s.split.paidFor
              ..person = s.person
              ..isSplitwise = s.split.isSplitwise;
        _splits.add(entry);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('d MMM yyyy').format(_selectedDate);
    final timeStr = _selectedTime.format(context);

    final transactionTypesAsync = ref.watch(allTransactionTypeProvider);

    return transactionTypesAsync.when(
      loading:
          () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
      error:
          (e, _) => Scaffold(body: Center(child: Text('Something went wrong'))),
      data: (types) {
        _transcationType ??= types.firstWhere(
          (type) => type.id == _transactionTypeId,
          orElse: () => types.first,
        );

        return Scaffold(
          appBar: AppBar(title: const Text('Add transaction')),
          floatingActionButton: FloatingActionButton(
            onPressed: _addTransaction,
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
            child: const Icon(Icons.save),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ListTile(
                leading: const Icon(Icons.category),
                title: const Text('Type'),
                trailing: Text(_transcationType!.name),
                onTap: () => _showExpenseTypeSelector(context, types),
              ),

              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: const Icon(Icons.calendar_today),
                      title: Text(dateStr),
                      onTap: _pickDate,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ListTile(
                      leading: const Icon(Icons.access_time),
                      title: Text(timeStr),
                      onTap: _pickTime,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.currency_rupee),
                  labelText: 'Amount',
                  filled: true,
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
                style: Theme.of(context).textTheme.bodyMedium,
                onChanged: (_) => setState(() {}),
              ),

              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.category),
                title: const Text('Category'),
                trailing: const Text('Others'),
                onTap: _showTransactionCategorySelector,
              ),

              ListTile(
                leading: const Icon(Icons.account_balance_wallet),
                title: const Text('Payment mode'),
                trailing: Text(_selectedSource?.source.name ?? 'Select'),
                onTap: _showSourceSelector,
              ),

              const SizedBox(height: 24),
              Text(
                'Other details',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),

              ListTile(
                leading: const Icon(Icons.notes),
                title: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write a note',
                    filled: true,
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),

              const SizedBox(height: 24),
              Text(
                'Split Expense',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              if (_splits.isNotEmpty) ...[
                const SizedBox(height: 20),
                Text(
                  'Split total: ₹${_splitTotal.toStringAsFixed(2)} / ₹${_amountController.text}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _splitTotalMismatch ? Colors.red : Colors.green,
                  ),
                ),
              ],
              const SizedBox(height: 12),
              ..._splits.asMap().entries.map((entry) {
                final i = entry.key;
                final s = entry.value;
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Split ${i + 1}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (_splits.isNotEmpty)
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed:
                                    () => setState(() => _splits.removeAt(i)),
                              ),
                          ],
                        ),
                        TextField(
                          controller: s.amountController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Amount',
                          ),
                          onChanged: (_) => setState(() {}),
                        ),
                        const SizedBox(height: 8),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(Icons.person),
                          title: const Text('Paid For'),
                          trailing: Text(
                            s.paidFor == 'self'
                                ? 'Self'
                                : s.person?.name ?? 'Someone Else',
                          ),
                          onTap: () async {
                            final selected = await showModalBottomSheet<String>(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder:
                                  (context) => Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        title: const Text('Self'),
                                        onTap:
                                            () =>
                                                Navigator.pop(context, 'self'),
                                      ),
                                      ListTile(
                                        title: const Text('Someone Else'),
                                        onTap:
                                            () => Navigator.pop(
                                              context,
                                              'someoneElse',
                                            ),
                                      ),
                                    ],
                                  ),
                            );

                            if (selected != null) {
                              setState(() {
                                s.paidFor = selected;
                                if (s.paidFor == 'self') s.person = null;
                              });
                              if (selected == 'someoneElse') {
                                _showPersonSelectorFor(s);
                              }
                            }
                          },
                        ),
                        if (s.paidFor == 'someoneElse' && s.person != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text('Person: ${s.person!.name}'),
                          ),
                        SwitchListTile(
                          value: s.isSplitwise,
                          title: const Text('On Splitwise'),
                          onChanged:
                              (val) => setState(() => s.isSplitwise = val),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              TextButton.icon(
                onPressed: () => setState(() => _splits.add(_SplitEntry())),
                icon: const Icon(Icons.add),
                label: const Text('Add Split'),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null) setState(() => _selectedTime = picked);
  }

  void _showExpenseTypeSelector(
    BuildContext context,
    List<TransactionType> types,
  ) async {
    final selected = await showModalBottomSheet<TransactionType>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children:
                types.map((type) {
                  return ListTile(
                    title: Text(type.name),
                    onTap: () => Navigator.pop(context, type),
                  );
                }).toList(),
          ),
    );

    if (selected != null) {
      setState(() => _transcationType = selected);
    }
  }

  void _showSourceSelector() async {
    final selected = await showModalBottomSheet<SourceWithEverything>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Consumer(
          builder: (context, ref, _) {
            final asyncSources = ref.watch(allSourceProvider);
            return asyncSources.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
              data:
                  (sources) => ListView(
                    padding: const EdgeInsets.all(16),
                    children:
                        sources.map((source) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              leading: const Icon(
                                Icons.account_balance_wallet_outlined,
                              ),
                              title: Text(source.source.name),
                              subtitle: Text(source.sourceType?.name ?? ''),
                              onTap: () => Navigator.pop(context, source),
                            ),
                          );
                        }).toList(),
                  ),
            );
          },
        );
        // return FutureBuilder<List<Source>>(
        //   future:
        //       ref
        //           .read(appDatabaseProvider)
        //           .select(ref.read(appDatabaseProvider).sources)
        //           .get(),
        //   builder: (context, snapshot) {
        //     if (!snapshot.hasData)
        //       return const Center(child: CircularProgressIndicator());

        //     return ListView(
        //       padding: const EdgeInsets.all(16),
        //       children:
        //           snapshot.data!
        //               .map(
        //                 (source) => Card(
        //                   shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(12),
        //                   ),
        //                   margin: const EdgeInsets.symmetric(vertical: 8),
        //                   child: ListTile(
        //                     leading: const Icon(
        //                       Icons.account_balance_wallet_outlined,
        //                     ),
        //                     title: Text(source.name),
        //                     // subtitle: Text('Balance: ₹${source.balance.toStringAsFixed(2)}'),
        //                     onTap: () => Navigator.pop(context, source),
        //                   ),
        //                 ),
        //               )
        //               .toList(),
        //     );
        //   },
        // );
      },
    );

    if (selected != null) setState(() => _selectedSource = selected);
  }

  void _showTransactionCategorySelector() async {
    final selected = await showModalBottomSheet<TransactionCategory>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Consumer(
          builder: (context, ref, _) {
            final asynchTxnCategory = ref.watch(allTransactionCategoryProvider);
            return asynchTxnCategory.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
              data:
                  (sources) => ListView(
                    padding: const EdgeInsets.all(16),
                    children:
                        sources.map((txnCat) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              leading: const Icon(
                                Icons.category,
                              ),
                              title: Text(txnCat.name),
                              onTap: () => Navigator.pop(context, txnCat),
                            ),
                          );
                        }).toList(),
                  ),
            );
          },
        );
      },
    );

    if (selected != null) setState(() => _selectedTxnCat = selected);
  }

  void _showPersonSelectorFor(_SplitEntry entry) async {
    final selected = await showModalBottomSheet<Person>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return FutureBuilder<List<Person>>(
          future:
              ref
                  .read(appDatabaseProvider)
                  .select(ref.read(appDatabaseProvider).persons)
                  .get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView(
              padding: const EdgeInsets.all(16),
              children:
                  snapshot.data!
                      .map(
                        (person) => Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: const Icon(Icons.person_outline),
                            title: Text(person.name),
                            onTap: () => Navigator.pop(context, person),
                          ),
                        ),
                      )
                      .toList(),
            );
          },
        );
      },
    );

    if (selected != null) setState(() => entry.person = selected);
  }

  void _addTransaction() async {
    final isEdit = widget.existing != null;
    final amount = double.tryParse(_amountController.text);
    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid amount')),
      );
      return;
    }

    if (_selectedSource == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a valid source')),
      );
      return;
    }

    final txnId = _uuid.v4();
    final txn = TransactionsCompanion(
      id: drift.Value(txnId),
      transactionTypeId: drift.Value(_transcationType!.id),
      amount: drift.Value(amount),
      sourceId: drift.Value(_selectedSource!.source.id),
      timestamp: drift.Value(
        DateTime(
          _selectedDate.year,
          _selectedDate.month,
          _selectedDate.day,
          _selectedTime.hour,
          _selectedTime.minute,
        ),
      ),
      categoryId: const drift.Value('Others'),
    );

    final totalAmount = double.tryParse(_amountController.text) ?? 0;
    if (_splits.isEmpty) {
      _splits.add(
        _SplitEntry()
          ..paidFor = "self"
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

    final splits =
        _splits
            .map(
              (s) => SplitItemsCompanion(
                transactionId: drift.Value(txnId),
                amount: drift.Value(
                  double.tryParse(s.amountController.text) ?? 0,
                ),
                paidFor: drift.Value(s.paidFor),
                personId:
                    s.person != null
                        ? drift.Value(s.person!.id)
                        : const drift.Value.absent(),
                isSplitwise: drift.Value(s.isSplitwise),
              ),
            )
            .toList();

    final db = ref.read(appDatabaseProvider);
    if (isEdit) {
      await db.transactionDao.updateTransactionWithSplits(txn, splits);
    } else {
      await db.transactionDao.insertTransactionWithSplits(txn, splits);
    }

    if (context.mounted) Navigator.pop(context);
  }
}

class _SplitEntry {
  final TextEditingController amountController = TextEditingController();
  String paidFor = 'self';
  Person? person;
  bool isSplitwise = false;
}
