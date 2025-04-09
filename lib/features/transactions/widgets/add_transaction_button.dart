import 'package:expense_tracker_app/core/models/enums.dart';
import 'package:expense_tracker_app/features/transactions/views/add_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class AddTransactionButton extends StatelessWidget {
  const AddTransactionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Colors.white,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.shopping_cart),
          label: 'Add Expense',
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddTransactionScreen()),
              ),
        ),
        SpeedDialChild(
          child: const Icon(Icons.swap_horiz),
          label: 'Add Transfer',
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => const AddTransactionScreen(
                        defaultType: TransactionType.transfer,
                      ),
                ),
              ),
        ),
        SpeedDialChild(
          child: const Icon(Icons.attach_money),
          label: 'Add Income',
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => const AddTransactionScreen(
                        defaultType: TransactionType.income,
                      ),
                ),
              ),
        ),
      ],
    );
  }
}
