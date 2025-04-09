import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker_app/core/models/enums.dart';
import 'package:expense_tracker_app/db/app_database.dart';
import 'package:expense_tracker_app/db/providers.dart';

class SplitFormEntry {
  final TextEditingController amountController = TextEditingController();
  PaidFor paidFor = PaidFor.self;
  String? personId;
  bool isSplitwise = false;
  bool hasListener = false;
}

class SplitSection extends ConsumerWidget {
  final List<SplitFormEntry> splits;
  final void Function() onAddSplit;
  final void Function(int index) onRemoveSplit;
  final void Function()? triggerUpdate;
  final TextEditingController totalExpenseController;

  const SplitSection({
    super.key,
    required this.splits,
    required this.onAddSplit,
    required this.onRemoveSplit,
    this.triggerUpdate,
    required this.totalExpenseController,
  });

  double get _splitTotal {
    return splits.fold(0.0, (sum, entry) {
      return sum + (double.tryParse(entry.amountController.text) ?? 0);
    });
  }

  bool get _splitTotalMismatch {
    final txnAmount = double.tryParse(totalExpenseController.text) ?? 0;
    return (_splitTotal - txnAmount).abs() > 0.01;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(appDatabaseProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Split Expense', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        ...splits.asMap().entries.map((entry) {
          final index = entry.key;
          final split = entry.value;

          if (!split.hasListener && triggerUpdate != null) {
            split.amountController.addListener(triggerUpdate!);
            split.hasListener = true;
          }

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 36.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Split ${index + 1}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),

                        TextFormField(
                          controller: split.amountController,
                          decoration: const InputDecoration(
                            labelText: 'Amount',
                          ),
                          keyboardType: TextInputType.number,
                          validator:
                              (val) =>
                                  val == null || val.isEmpty
                                      ? 'Enter amount'
                                      : null,
                        ),

                        DropdownButtonFormField<PaidFor>(
                          value: split.paidFor,
                          decoration: const InputDecoration(
                            labelText: 'Paid For',
                          ),
                          items:
                              PaidFor.values.map((pf) {
                                return DropdownMenuItem(
                                  value: pf,
                                  child: Text(pf.label),
                                );
                              }).toList(),
                          onChanged: (val) {
                            if (val != null) {
                              split.paidFor = val;
                              triggerUpdate?.call();
                            }
                          },
                        ),

                        if (split.paidFor == PaidFor.someoneElse)
                          FutureBuilder<List<Person>>(
                            future: db.select(db.persons).get(),
                            builder: (context, snapshot) {
                              final people = snapshot.data ?? [];
                              return DropdownButtonFormField<String>(
                                value: split.personId,
                                decoration: const InputDecoration(
                                  labelText: 'Person',
                                ),
                                items:
                                    people
                                        .map(
                                          (p) => DropdownMenuItem(
                                            value: p.id,
                                            child: Text(p.name),
                                          ),
                                        )
                                        .toList(),
                                onChanged: (val) {
                                  split.personId = val;
                                  triggerUpdate?.call();
                                }
                              );
                            },
                          ),

                        CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text('On Splitwise'),
                          value: split.isSplitwise,
                          onChanged: (val) {
                            split.isSplitwise = val ?? false;
                            triggerUpdate?.call();
                          }
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => onRemoveSplit(index),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
        if (splits.isNotEmpty)
          Text(
            'Split Total: ₹${_splitTotal.toStringAsFixed(2)} / ₹${totalExpenseController.text}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: _splitTotalMismatch ? Colors.red : Colors.green,
            ),
          ),
        const SizedBox(height: 24),
        TextButton.icon(
          onPressed: onAddSplit,
          icon: const Icon(Icons.add),
          label: const Text('Add Split'),
        ),
      ],
    );
  }
}
