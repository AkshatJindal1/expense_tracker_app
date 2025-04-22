import 'package:expense_tracker_app/db/daos/investment_type_dao.dart';
import 'package:expense_tracker_app/db/daos/transaction_category_dao.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_database.dart';
import 'daos/transaction_dao.dart';
import 'daos/source_dao.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  throw UnimplementedError('Must be overridden in main.dart');
});

final sourceDaoProvider = Provider<SourceDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.sourceDao;
});
final transactionDaoProvider = Provider<TransactionDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.transactionDao;
});
final transactionCategoryDaoProvider = Provider<TransactionCategoryDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.transactionCategoryDao;
});

final investmentTypeDaoProvider = Provider<InvestmentTypeDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.investmentTypeDao;
});

// /// Provides the TransactionDao using the AppDatabase
// final transactionDaoProvider = Provider<TransactionDao>((ref) {
//   final db = ref.watch(appDatabaseProvider);
//   return TransactionDao(db);
// });

// final sourceDaoProvider = Provider<SourceDao>((ref) {
//   final db = ref.watch(appDatabaseProvider);
//   return SourceDao(db);
// });

// final transactionCategoryDaoProvider = Provider<TransactionCategoryDao>((ref) {
//   final db = ref.watch(appDatabaseProvider);
//   return TransactionCategoryDao(db);
// });
