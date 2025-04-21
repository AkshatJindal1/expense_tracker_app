import 'package:expense_tracker_app/db/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker_app/core/models/transaction_with_everything.dart';
import 'package:expense_tracker_app/db/providers.dart';

// StreamProvider for watching all transactions (live updates)
final allTransactionsProvider = StreamProvider<List<TransactionWithEverything>>(
  (ref) {
    final dao = ref.watch(transactionDaoProvider);
    return dao.watchAllTransactions();
  },
);

// StreamProvider for watching recent transactions (live updates)
final recentTransactionsStreamProvider =
    StreamProvider<List<TransactionWithEverything>>((ref) {
      final dao = ref.watch(transactionDaoProvider);
      return dao.watchRecentTransactions();
    });

final allTransactionTypeProvider = FutureProvider<List<TransactionType>>((ref) {
  final db = ref.read(appDatabaseProvider);
  return db.select(db.transactionTypes).get();
});

final allTransactionCategoryProvider =
    StreamProvider<List<TransactionCategory>>((ref) {
      final dao = ref.watch(transactionCategoryDaoProvider);
      return dao.watchAllTransactionCategory();
    });
