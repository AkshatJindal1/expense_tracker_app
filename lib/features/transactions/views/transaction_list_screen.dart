import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker_app/features/transactions/providers/transactions_provider.dart';

class TransactionListScreen extends ConsumerWidget {
  const TransactionListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final asyncTxns = ref.watch(allTransactionsProvider);

    // return Scaffold(
    //   appBar: AppBar(title: const Text("Transactions")),
    //   body: asyncTxns.when(
    //     loading: () => const Center(child: CircularProgressIndicator()),
    //     error: (err, stack) => Center(child: Text("Error: $err")),
    //     data: (transactions) {
    //       if (transactions.isEmpty) return const Center(child: Text("No transactions yet"));

    //       return ListView.builder(
    //         itemCount: transactions.length,
    //         itemBuilder: (context, index) {
    //           final txn = transactions[index].transaction;
    //           final splits = transactions[index].splits;

    //           return Card(
    //             margin: const EdgeInsets.all(8),
    //             child: ListTile(
    //               title: Text('${txn.category ?? txn.transactionType} - ₹${txn.amount}'),
    //               subtitle: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(txn.note ?? '', style: const TextStyle(fontSize: 12)),
    //                   const SizedBox(height: 4),
    //                   Text(
    //                     splits.map((s) =>
    //                       '${s.paidFor}: ₹${s.amount}${s.personId != null ? ' (${s.personId})' : ''}'
    //                     ).join(' | '),
    //                     style: const TextStyle(fontSize: 12),
    //                   )
    //                 ],
    //               ),
    //             ),
    //           );
    //         },
    //       );
    //     },
    //   ),
    // );

    final asyncTxns = ref.watch(allTransactionsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Transactions")),
      body:  asyncTxns.when(
      data: (txns) {
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
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    ));

  }
}
