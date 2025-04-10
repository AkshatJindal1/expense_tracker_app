import 'package:expense_tracker_app/features/transactions/widgets/add_menu.dart';
import 'package:expense_tracker_app/features/transactions/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class LoanCenterScreen extends StatelessWidget {
  const LoanCenterScreen({super.key});

  static final List<FabMenuEntry> menuItems = [
    FabMenuEntry(
      label: 'Loan Given',
      icon: Icons.upload,
      onTap: () => print('Loan Given'),
    ),
    FabMenuEntry(
      label: 'Loan Taken',
      icon: Icons.download,
      onTap: () => print('Loan Taken'),
    ),
    FabMenuEntry(
      label: 'Repayment Made',
      icon: Icons.send,
      onTap: () => print('Repayment Made'),
    ),
    FabMenuEntry(
      label: 'Repayment Received',
      icon: Icons.call_received,
      onTap: () => print('Repayment Received'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: const Text('Loan Center')),
      floatingActionButton: AddMenu(items: menuItems),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Your Balances',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          // TODO: Replace with real data from DB
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              children: [
                _loanCard(context, name: 'Alice', amount: -1000),
                _loanCard(context, name: 'Bob', amount: 400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _loanCard(
    BuildContext context, {
    required String name,
    required double amount,
  }) {
    final bool isOwed = amount > 0;
    final color = isOwed ? Colors.green : Colors.red;
    final arrowIcon = isOwed ? Icons.arrow_downward : Icons.arrow_upward;
    final text =
        isOwed ? 'Owes you ₹${amount.abs()}' : 'You owe ₹${amount.abs()}';

    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
          width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(name),
        subtitle: Text(text),
        trailing: Icon(arrowIcon, color: color),
      ),
    );
  }
}
