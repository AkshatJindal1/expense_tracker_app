import 'package:expense_tracker_app/db/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'db/app_database.dart';
import 'db/sample_seed.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = AppDatabase();
  await insertSampleData(db); // only for dev.

  runApp(ProviderScope(
    overrides: [
      appDatabaseProvider.overrideWithValue(db),
    ],
    child: ExpenseTrackerApp()));
}
