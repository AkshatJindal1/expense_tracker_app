import 'package:expense_tracker_app/db/providers.dart';
import 'package:expense_tracker_app/features/transactions/views/add_transaction_screen_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker_app/features/transactions/providers/transactions_provider.dart';

class AllTransactionsScreen extends ConsumerStatefulWidget {
  const AllTransactionsScreen({super.key});

  @override
  ConsumerState<AllTransactionsScreen> createState() =>
      _AllTransactionsScreenState();
}

class _AllTransactionsScreenState extends ConsumerState<AllTransactionsScreen> {
  final Set<String> _selectedTxnIds = {};
  bool _selectionMode = false;

  void _handleDeleteSelected() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Delete Transactions'),
            content: Text(
              'Are you sure you want to delete ${_selectedTxnIds.length} transaction(s)?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Delete'),
              ),
            ],
          ),
    );

    if (confirmed == true) {
      final db = ref.read(appDatabaseProvider);
      for (final id in _selectedTxnIds) {
        await db.transactionDao.deleteTransaction(id);
      }

      setState(() {
        _selectionMode = false;
        _selectedTxnIds.clear();
      });

      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Transactions deleted')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                : 'All Transactions',
          ),
          actions: [
            if (_selectionMode)
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: _handleDeleteSelected,
              ),
          ],
        ),
        body: asyncTxns.when(
          data: (txns) {
            if (txns.isEmpty) {
              return const Center(child: Text('No transactions found'));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: txns.length,
              itemBuilder: (context, index) {
                final tx = txns[index];
                final txn = tx.txn;
                final selected = _selectedTxnIds.contains(tx.txn.id);
                final isDark = Theme.of(context).brightness == Brightness.dark;
                var cardColor = Theme.of(context).cardColor;
                var icon = Icons.more_horiz;
                switch (txn.transactionType) {
                  case 'transfer':
                    cardColor =
                        isDark ? Colors.blue.shade900 : Colors.blue.shade50;
                    icon = Icons.swap_horiz;
                    break;
                  case 'income':
                    cardColor =
                        isDark ? Colors.green.shade900 : Colors.green.shade50;
                    icon = Icons.attach_money;
                    break;
                }

                return Card(
                  color: selected ? cardColor.withOpacity(0.1) : cardColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      ListTile(
                        onLongPress: () {
                          setState(() {
                            _selectionMode = true;
                            _selectedTxnIds.add(tx.txn.id);
                          });
                        },
                        onTap: () {
                          if (_selectionMode) {
                            setState(() {
                              if (selected) {
                                _selectedTxnIds.remove(tx.txn.id);
                                if (_selectedTxnIds.isEmpty)
                                  _selectionMode = false;
                              } else {
                                _selectedTxnIds.add(tx.txn.id);
                              }
                            });
                          }
                        },
                        leading:
                            _selectionMode
                                ? Checkbox(
                                  value: selected,
                                  onChanged: (val) {
                                    setState(() {
                                      if (val == true) {
                                        _selectedTxnIds.add(tx.txn.id);
                                      } else {
                                        _selectedTxnIds.remove(tx.txn.id);
                                      }
                                      if (_selectedTxnIds.isEmpty)
                                        _selectionMode = false;
                                    });
                                  },
                                )
                                : CircleAvatar(
                                  backgroundColor:
                                      isDark
                                          ? Colors.grey.shade800
                                          : Colors.grey.shade200,
                                  child: Icon(
                                    icon,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                        title: Text(
                          '₹${txn.amount}',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          txn.category ?? "Not specified",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              DateFormat('d MMM yy').format(txn.timestamp),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (_) => AddTransactionV2Screen(
                                          existing: tx,
                                        ),
                                  ),
                                );
                              },
                              child: const Icon(Icons.edit, size: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
        ),
      ),
    );
  }
}
