import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/transactions.dart';
import '../tables/split_items.dart';
import 'package:expense_tracker_app/core/models/transaction_with_everything.dart';

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
  Future<List<TransactionWithEverything>> getAllTransactions() async {
    final txnRows = await select(transactions).get();
    return Future.wait(txnRows.map(_mapFullTransactions).toList());
  }

  // Watch all transactions (stream for UI)
  Stream<List<TransactionWithEverything>> watchAllTransactions() {
    return select(transactions).watch().asyncMap((txns) async {
      return Future.wait(txns.map(_mapFullTransactions).toList());
    });
  }

  // Delete a transaction and its splits
  Future<void> deleteTransaction(String txnId) async {
    await transaction(() async {
      await (delete(splitItems)..where((tbl) => tbl.transactionId.equals(txnId))).go();
      await (delete(transactions)..where((tbl) => tbl.id.equals(txnId))).go();
    });
  }

  Future<TransactionWithEverything> _mapFullTransactions(Transaction txn) async {
    // final txnRows = await select(transactions).get();

    final source = await (select(sources)..where((s) => s.id.equals(txn.sourceId))).getSingleOrNull();
    final destination = txn.toSourceId != null
        ? await (select(sources)..where((s) => s.id.equals(txn.toSourceId!))).getSingleOrNull()
        : null;
    final feeSource = txn.feeSourceId != null
        ? await (select(sources)..where((s) => s.id.equals(txn.feeSourceId!))).getSingleOrNull()
        : null;

    final splitJoin = (select(splitItems)..where((s) => s.transactionId.equals(txn.id)))
        .join([leftOuterJoin(persons, persons.id.equalsExp(splitItems.personId))]);

    final joinedSplits = await splitJoin.get();

    final splits = joinedSplits.map((row) {
      final split = row.readTable(splitItems);
      final person = row.readTableOrNull(persons);
      return SplitItemWithPerson(split: split, person: person);
    }).toList();

    return TransactionWithEverything(
      txn: txn,
      source: source,
      destination: destination,
      feeSource: feeSource,
      splits: splits,
    );
  }

}
