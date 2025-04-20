import 'package:expense_tracker_app/features/transactions/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'features/transactions/views/transaction_list_screen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: FlexThemeData.light(
        scheme: FlexScheme.bigStone,
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.bigStone,
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      themeMode: ThemeMode.system,
      // home: const TransactionListScreen(),
      home: const HomeScreen(),
    );
  }
}
