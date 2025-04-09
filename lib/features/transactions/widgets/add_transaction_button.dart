import 'package:expense_tracker_app/core/models/enums.dart';
import 'package:expense_tracker_app/features/transactions/views/add_transaction_screen.dart';
import 'package:flutter/material.dart';

class AddTransactionButton extends StatelessWidget {
  const AddTransactionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final choice = await showModalBottomSheet<String>(
          context: context,
          builder: (_) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: const Text('Add Expense'),
                  onTap: () => Navigator.pop(context, 'expense'),
                ),
                ListTile(
                  leading: const Icon(Icons.swap_horiz),
                  title: const Text('Add Transfer'),
                  onTap: () => Navigator.pop(context, 'transfer'),
                ),
                ListTile(
                  leading: const Icon(Icons.attach_money),
                  title: const Text('Add Income'),
                  onTap: () => Navigator.pop(context, 'income'),
                ),
              ],
            );
          },
        );

        switch (choice) {
          case 'expense':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddTransactionScreen()),
            );
            break;
          case 'transfer':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (_) => const AddTransactionScreen(
                      defaultType: TransactionType.transfer,
                    ),
              ),
            );
            break;
          case 'income':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (_) => const AddTransactionScreen(
                      defaultType: TransactionType.income,
                    ),
              ),
            );
            break;
        }
      },
      child: const Icon(Icons.add),
    );
  }
}
