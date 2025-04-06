import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/transactions.dart';
import '../tables/split_items.dart';

part 'transaction_dao.g.dart';

@DriftAccessor(tables: [Transactions, SplitItems])
class TransactionDao extends DatabaseAccessor<AppDatabase> with _$TransactionDaoMixin {
  TransactionDao(super.db);

  // Insert a transaction with associated split items
  Future<void> insertTransactionWithSplits(
      TransactionsCompanion txn, List<SplitItemsCompanion> splits) async {
    await transaction(() async {
      await into(transactions).insert(txn);
      for (final split in splits) {
        await into(splitItems).insert(split);
      }
    });
  }

  // Get all transactions (basic)
  Future<List<TransactionWithSplits>> getAllTransactions() async {
    final txnRows = await select(transactions).get();
    return Future.wait(txnRows.map(_mapTransactionWithSplits).toList());
  }

  // Watch all transactions (stream for UI)
  Stream<List<TransactionWithSplits>> watchAllTransactions() {
    return select(transactions).watch().asyncMap((txns) async {
      return Future.wait(txns.map(_mapTransactionWithSplits).toList());
    });
  }

  // Combine a transaction with its split items
  Future<TransactionWithSplits> _mapTransactionWithSplits(Transaction txn) async {
    final splits = await (select(splitItems)
          ..where((tbl) => tbl.transactionId.equals(txn.id)))
        .get();
    return TransactionWithSplits(transaction: txn, splits: splits);
  }

  // Delete a transaction and its splits
  Future<void> deleteTransaction(String txnId) async {
    await transaction(() async {
      await (delete(splitItems)..where((tbl) => tbl.transactionId.equals(txnId))).go();
      await (delete(transactions)..where((tbl) => tbl.id.equals(txnId))).go();
    });
  }
}

/// DTO to return a transaction with its split items
class TransactionWithSplits {
  final Transaction transaction;
  final List<SplitItem> splits;

  TransactionWithSplits({required this.transaction, required this.splits});
}
