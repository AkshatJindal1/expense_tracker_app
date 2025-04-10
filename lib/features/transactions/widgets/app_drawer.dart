import 'package:expense_tracker_app/features/transactions/views/loan_center_screen.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/features/transactions/views/transaction_list_screen.dart';
// import 'package:expense_tracker_app/features/loans/views/loan_center_screen.dart';
// import 'package:expense_tracker_app/features/people/views/people_screen.dart';
// import 'package:expense_tracker_app/features/sources/views/sources_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      backgroundColor: theme.colorScheme.surfaceContainerHighest,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: theme.colorScheme.primary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 48,
                  color: theme.colorScheme.onPrimary,
                ),
                const SizedBox(height: 8),
                Text(
                  'Expense Tracker',
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Track your money smartly',
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary.withValues(alpha: 0.7),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          ListTile(
            leading: const Icon(Icons.list_alt_rounded),
            title: const Text('Transactions'),
            onTap: () {
              Navigator.pop(context);
              Future.delayed(const Duration(milliseconds: 200), () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionListScreen(),
                  ),
                );
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.wallet_rounded),
            title: const Text('Loan Center'),
            onTap: () {
              Navigator.pop(context);
              Future.delayed(const Duration(milliseconds: 200), () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoanCenterScreen(),
                  ),
                );
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.groups),
            title: const Text('Manage People'),
            onTap: () {
              Navigator.pop(context);
              Future.delayed(const Duration(milliseconds: 200), () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionListScreen(),
                  ),
                );
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: const Text('Manage Sources'),
            onTap: () {
              Navigator.pop(context);
              Future.delayed(const Duration(milliseconds: 200), () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TransactionListScreen(),
                  ),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
