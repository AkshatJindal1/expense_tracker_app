import 'package:expense_tracker_app/core/models/enums.dart';
import 'package:expense_tracker_app/features/transactions/views/add_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class FabMenuEntry {
  final String? label;
  final IconData? icon;
  final VoidCallback onTap;

  const FabMenuEntry({
    required this.label,
    required this.icon,
    required this.onTap,
  });
}

class AddMenu extends StatelessWidget {
  final List<FabMenuEntry> items;
  const AddMenu({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Colors.white,
      overlayColor: Colors.black,
      overlayOpacity: 0.7,
      children: items.map((entry) {
        return SpeedDialChild(
          child: Icon(entry.icon),
          label: entry.label,
          onTap: entry.onTap,
        );
      }).toList(),
      // children: [
      //   SpeedDialChild(
      //     child: const Icon(Icons.shopping_cart),
      //     label: 'Add Expense',
      //     onTap:
      //         () => Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (_) => const AddTransactionScreen()),
      //         ),
      //   ),
      //   SpeedDialChild(
      //     child: const Icon(Icons.swap_horiz),
      //     label: 'Add Transfer',
      //     onTap:
      //         () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder:
      //                 (_) => const AddTransactionScreen(
      //                   defaultType: TransactionType.transfer,
      //                 ),
      //           ),
      //         ),
      //   ),
      //   SpeedDialChild(
      //     child: const Icon(Icons.attach_money),
      //     label: 'Add Income',
      //     onTap:
      //         () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder:
      //                 (_) => const AddTransactionScreen(
      //                   defaultType: TransactionType.income,
      //                 ),
      //           ),
      //         ),
      //   ),
      // ],
    );
  }
}
