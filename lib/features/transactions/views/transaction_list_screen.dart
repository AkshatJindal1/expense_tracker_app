import 'package:expense_tracker_app/core/models/enums.dart';
import 'package:expense_tracker_app/features/transactions/views/add_transaction_screen.dart';
import 'package:expense_tracker_app/features/transactions/widgets/add_transaction_button.dart';
import 'package:expense_tracker_app/features/transactions/widgets/delete_transactions_button.dart';
import 'package:expense_tracker_app/features/transactions/widgets/transaction_type_choicechip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker_app/features/transactions/providers/transactions_provider.dart';

class TransactionListScreen extends ConsumerStatefulWidget {
  const TransactionListScreen({super.key});

  @override
  ConsumerState<TransactionListScreen> createState() =>
      _TransactionListScreenState();
}

class _TransactionListScreenState extends ConsumerState<TransactionListScreen> {
  final Set<String> _selectedTxnIds = {};
  bool _selectionMode = false;
  TransactionType? _filterType;

  @override
  Widget build(BuildContext context) {
    final ref = this.ref;
    final asyncTxns = ref.watch(allTransactionsProvider);

    return PopScope(
      canPop: !_selectionMode,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop && _selectionMode) {
          setState(() {
            _selectionMode = false;
            _selectedTxnIds.clear();
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _selectionMode
                ? '${_selectedTxnIds.length} selected'
                : 'Transactions',
          ),
          actions: [
            if (_selectionMode)
              DeleteTransactionsButton(
                selectedTxnIds: _selectedTxnIds,
                onDeletionComplete:
                    () => setState(() {
                      _selectionMode = false;
                      _selectedTxnIds.clear();
                    }),
              ),
          ],
        ),
        floatingActionButton: AddTransactionButton(),
        body: asyncTxns.when(
          data: (txns) {
            if (txns.isEmpty) {
              return const Center(child: Text("No transactions yet"));
            }
            final filteredTxns =
                _filterType == null
                    ? txns
                    : txns
                        .where(
                          (t) => t.txn.transactionType == _filterType!.name,
                        )
                        .toList();

            return Column(
              children: [
                TransactionTypeChoiceChip(
                  transactionType: _filterType,
                  onSelected:
                      (type, isSelected) => setState(
                        () => _filterType = isSelected ? null : type,
                      ),
                ),
                SizedBox(height: 12),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredTxns.length,
                    itemBuilder: (context, index) {
                      final tx = filteredTxns[index];
                      final txnId = tx.txn.id;
                      final selected = _selectedTxnIds.contains(txnId);
                      var leadingIcon = Icons.swap_horiz;
                      var leadingIconColor = Colors.blue;
                      switch (TransactionType.values.byName(
                        tx.txn.transactionType,
                      )) {
                        case TransactionType.expense:
                          leadingIcon = Icons.remove_circle_outline;
                          leadingIconColor = Colors.red;
                          break;
                        case TransactionType.income:
                          leadingIcon = Icons.add_circle_outline;
                          leadingIconColor = Colors.green;
                          break;
                        case TransactionType.transfer:
                          leadingIcon = Icons.swap_horiz;
                          leadingIconColor = Colors.blue;
                          break;
                        default:
                          break;
                      }

                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color:
                            selected
                                ? (Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Theme.of(
                                      context,
                                    ).colorScheme.primary.withValues(alpha: 0.1)
                                    : Theme.of(
                                      context,
                                    ).colorScheme.primary.withValues(alpha: 0.05))
                                : Theme.of(context).cardColor,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            if (_selectionMode) {
                              setState(() {
                                if (selected) {
                                  _selectedTxnIds.remove(txnId);
                                  if (_selectedTxnIds.isEmpty) {
                                    _selectionMode = false;
                                  }
                                } else {
                                  _selectedTxnIds.add(txnId);
                                }
                              });
                            }
                          },
                          onLongPress: () {
                            setState(() {
                              _selectionMode = true;
                              _selectedTxnIds.add(txnId);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _selectionMode
                                    ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (selected) {
                                            _selectedTxnIds.remove(txnId);
                                            if (_selectedTxnIds.isEmpty) {
                                              _selectionMode = false;
                                            }
                                          } else {
                                            _selectedTxnIds.add(txnId);
                                          }
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: 16,
                                        backgroundColor:
                                            selected
                                                ? Theme.of(
                                                  context,
                                                ).colorScheme.primary
                                                : Colors.transparent,
                                        foregroundColor:
                                            selected
                                                ? Colors.white
                                                : Theme.of(
                                                  context,
                                                ).colorScheme.onSurfaceVariant,
                                        child: Icon(
                                          selected ? Icons.check : leadingIcon,
                                          color:
                                              selected
                                                  ? null
                                                  : leadingIconColor,
                                          size: 18,
                                        ),
                                      ),
                                    )
                                    : Icon(
                                      leadingIcon,
                                      color: leadingIconColor,
                                    ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${tx.txn.category} - ₹${tx.txn.amount.toStringAsFixed(2)}',
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.titleMedium,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        [
                                          if (tx.source != null)
                                            'From: ${tx.source!.name}',
                                          if (tx.destination != null)
                                            'To: ${tx.destination!.name}',
                                          if (tx.feeSource != null)
                                            'Charges: ${tx.feeSource!.name}',
                                          if (tx.splits.isNotEmpty)
                                            tx.splits
                                                .map(
                                                  (s) =>
                                                      '${s.split.paidFor}: ₹${s.split.amount} ${s.person?.name ?? ''}',
                                                )
                                                .join(' | '),
                                        ].join('\n'),
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => AddTransactionScreen(
                                              existing: tx,
                                            ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
        ),
      ),
    );
  }
}
