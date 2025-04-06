import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker_app/core/models/transaction_with_everything.dart';
import 'package:expense_tracker_app/db/providers.dart';

// StreamProvider for watching all transactions (live updates)
final allTransactionsProvider =
    StreamProvider<List<TransactionWithEverything>>((ref) {
  final dao = ref.watch(transactionDaoProvider);
  return dao.watchAllTransactions();
});
