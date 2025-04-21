import 'package:expense_tracker_app/db/daos/transaction_category_dao.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_database.dart';
import 'daos/transaction_dao.dart';
import 'daos/source_dao.dart';

/// Provides a singleton instance of the AppDatabase
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

/// Provides the TransactionDao using the AppDatabase
final transactionDaoProvider = Provider<TransactionDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return TransactionDao(db);
});

final sourceDaoProvider = Provider<SourceDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return SourceDao(db);
});

final transactionCategoryDaoProvider = Provider<TransactionCategoryDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return TransactionCategoryDao(db);
});
