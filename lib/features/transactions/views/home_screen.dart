import 'package:expense_tracker_app/features/transactions/views/add_transaction_screen_v2.dart';
import 'package:expense_tracker_app/features/transactions/views/all_transactions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker_app/features/transactions/providers/transactions_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentTxn = ref.watch(recentTransactionsStreamProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTransactionV2Screen()),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.inversePrimary,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Loan'),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance),
              label: 'Accounts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'More',
            ),
          ],
          onTap: (index) {
            // handle tab navigation
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _summaryTile(
                context,
                label: 'Spending',
                amount: 100,
                icon: Icons.arrow_upward,
              ),
              _summaryTile(
                context,
                label: 'Income',
                amount: 150,
                icon: Icons.arrow_downward,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Center(child: Chip(label: const Text('Balance: ₹50.0'))),

          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent transactions',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AllTransactionsScreen(),
                      ),
                    ),
                child: const Text('See all'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          recentTxn.when(
            data: (txns) {
              if (txns.isEmpty) {
                return const Text('No recent transactions');
              }
              return Column(
                children:
                    txns.map((tx) {
                      return _txnCard(
                        context,
                        icon: Icons.more_horiz,
                        amount: tx.txn.amount,
                        date: DateFormat('d MMM yy').format(tx.txn.timestamp),
                        category: tx.txn.category,
                        type: tx.txn.transactionType,
                      );
                    }).toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
          ),

          const SizedBox(height: 24),
          Text('Your budgets', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'April 2025',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Budget: ₹1,000.0',
                          style: TextStyle(fontSize: 10),
                        ),
                        SizedBox(height: 20),
                        Text('Total Spent', style: TextStyle(fontSize: 10)),
                        SizedBox(height: 4),
                        Text(
                          '₹900.0',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Available Budget',
                          style: TextStyle(fontSize: 10),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '₹900.0',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 60,
                            width: 60,
                            child: CircularProgressIndicator(
                              value: 0.1,
                              strokeWidth: 6,
                              color: Colors.green,
                              backgroundColor: Colors.grey.shade300,
                            ),
                          ),
                          const Text('90%\nLeft', textAlign: TextAlign.center),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryTile(
    BuildContext context, {
    required String label,
    required double amount,
    required IconData icon,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    var cardColor = Theme.of(context).cardColor;
    switch (label) {
      case "Spending":
        cardColor = isDark ? Colors.red.shade400 : Colors.red.shade700;
        break;
      case "Income":
        cardColor = isDark ? Colors.green.shade700 : Colors.green.shade600;
        break;
    }
    return Container(
      width: 140,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 4),
          Text(
            '₹${amount.toStringAsFixed(1)}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _txnCard(
    BuildContext context, {
    String? type,
    required IconData icon,
    required double amount,
    required String date,
    required String? category,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    var cardColor = Theme.of(context).cardColor;
    switch (type) {
      case "transfer":
        cardColor = isDark ? Colors.blue.shade900 : Colors.blue.shade50;
        break;
      case "income":
        cardColor = isDark ? Colors.green.shade900 : Colors.green.shade50;
        break;
    }
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
          child: Icon(icon, color: Theme.of(context).colorScheme.primary),
        ),
        title: Text(
          '₹$amount',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        subtitle: Text(
          category ?? "Not specified",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        trailing: Text(date, style: Theme.of(context).textTheme.bodySmall),
      ),
    );
  }
}
