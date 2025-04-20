import 'package:expense_tracker_app/features/transactions/views/add_transaction_screen_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker_app/features/transactions/providers/transactions_provider.dart';

class AllTransactionsScreen extends ConsumerWidget {
  const AllTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTxns = ref.watch(allTransactionsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
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
                color: cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            isDark
                                ? Colors.grey.shade800
                                : Colors.grey.shade200,
                        child: Icon(
                          icon,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      title: Text(
                        '₹${txn.amount}',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                                      (_) =>
                                          AddTransactionV2Screen(existing: tx),
                                ),
                              );
                            },
                            child: const Icon(Icons.edit, size: 12)
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
    );
  }
}
