import 'package:expense_tracker_app/core/models/enums.dart';
import 'package:expense_tracker_app/db/providers.dart';
import 'package:expense_tracker_app/features/transactions/views/add_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker_app/features/transactions/providers/transactions_provider.dart';

class TransactionListScreen extends ConsumerStatefulWidget {
  const TransactionListScreen({super.key});

  @override
  ConsumerState<TransactionListScreen> createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends ConsumerState<TransactionListScreen> {
  final Set<String> _selectedTxnIds = {};
  bool _selectionMode = false;
  
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
      title: Text(_selectionMode
        ? '${_selectedTxnIds.length} selected'
        : 'Transactions'),
      actions: [
        if (_selectionMode)
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Delete Transactions'),
                  content: Text(
                    'Are you sure you want to delete ${_selectedTxnIds.length} transactions?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Delete'),
                    )
                  ],
                )
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
              }
            },
          )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final ctx = context;
          final choice = await showModalBottomSheet<String>(
            context: ctx,
            builder: (_) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text('Add Expense'),
                    onTap: () => Navigator.pop(ctx, 'expense'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.swap_horiz),
                    title: const Text('Add Transfer'),
                    onTap: () => Navigator.pop(ctx, 'transfer'),
                  )
                ],
              );
            });

            if (!mounted) return;

            if (choice == 'expense') {
              Navigator.push(ctx, MaterialPageRoute(
                builder: (_) => const AddTransactionScreen()));
            } else {
              Navigator.push(ctx, MaterialPageRoute(
                builder: (_) => const AddTransactionScreen(defaultType: TransactionType.transfer)));
            }
          
        },
        child: const Icon(Icons.add),
      ),
      body:  asyncTxns.when(
      data: (txns) {
        if (txns.isEmpty) return const Center(child: Text("No transactions yet"));
        return ListView.builder(
          itemCount: txns.length,
          itemBuilder: (context, index) {
            final tx = txns[index];
            final txnId = tx.txn.id;
            final selected = _selectedTxnIds.contains(txnId);

            return ListTile(
              selected: selected,
              selectedTileColor: Colors.grey[900],
              onLongPress: () {
                setState(() {
                  _selectionMode = true;
                  _selectedTxnIds.add(txnId);
                });
              },
              onTap: () {
                if (_selectionMode) {
                  setState(() {
                    if (selected) {
                      _selectedTxnIds.remove(txnId);
                      if (_selectedTxnIds.isEmpty) _selectionMode = false;
                    } else {
                      _selectedTxnIds.add(txnId);
                    }
                  });
                }
              },
              leading: _selectionMode
                ? Checkbox(
                  value: selected,
                  onChanged: (val) {
                    setState(() {
                      if (val == true) {
                        _selectedTxnIds.add(txnId);
                      } else {
                        _selectedTxnIds.remove(txnId);
                      }
                      if (_selectedTxnIds.isEmpty) _selectionMode = false;
                    });
                  })
                : null,
              title: Text('${tx.txn.category} - ₹${tx.txn.amount}'),
              subtitle: Text(
                [
                  if (tx.source != null) 'From: ${tx.source!.name}',
                  if (tx.destination != null) 'To: ${tx.destination!.name}',
                  if (tx.feeSource != null) 'Charges From: ${tx.feeSource!.name}',
                  if (tx.splits.isNotEmpty)
                    tx.splits.map((s) => '${s.split.paidFor}: ₹${s.split.amount} ${s.person?.name ?? ''}').join(' | '),
                ].join('\n'),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => AddTransactionScreen(existing: tx)));
                },
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    ))
    );
  }
}
