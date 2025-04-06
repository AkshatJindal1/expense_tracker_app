import 'package:flutter/material.dart';
import 'features/transactions/views/transaction_list_screen.dart';

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData.dark(useMaterial3: true),
      home: const TransactionListScreen(),
    );
  }
}
