import 'package:expense_tracker_app/features/transactions/views/add_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker_app/features/transactions/providers/transactions_provider.dart';

class TransactionListScreen extends ConsumerWidget {
  const TransactionListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTxns = ref.watch(allTransactionsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Transactions")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const AddTransactionScreen()));
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

            return ListTile(
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
    ));

  }
}
