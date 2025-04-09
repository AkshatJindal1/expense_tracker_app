import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/transactions.dart';
import '../tables/split_items.dart';
import 'package:expense_tracker_app/core/models/transaction_with_everything.dart';
import 'package:uuid/uuid.dart';

part 'transaction_dao.g.dart';

@DriftAccessor(tables: [Transactions, SplitItems])
class TransactionDao extends DatabaseAccessor<AppDatabase> with _$TransactionDaoMixin {
  TransactionDao(super.db);

  // Insert a transaction with associated split items
  Future<void> insertTransactionWithSplits(
      TransactionsCompanion txn, List<SplitItemsCompanion> splits) async {
    final mergedSplits = _mergeSplitItems(txn.id.value, splits);

    await batch((b) {
      b.insert(transactions, txn);
      b.insertAll(splitItems, mergedSplits);
    });
  }

  Future<void> updateTransactionWithSplits(
    TransactionsCompanion txn,
    List<SplitItemsCompanion> splits,
  ) async {
    final mergedSplits = _mergeSplitItems(txn.id.value, splits);
    await batch((b) {
      b.update(transactions, txn);
      b.deleteWhere(splitItems, (s) => s.transactionId.equals(txn.id.value));
      b.insertAll(splitItems, mergedSplits);
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
    await (delete(transactions)..where((t) => t.id.equals(txnId))).go();
  }

  List<SplitItemsCompanion> _mergeSplitItems(
    String txnId,
    List<SplitItemsCompanion> splits,
  ) {
    final Map<(String?, String), double> groupedAmounts = {};
    final Map<(String?, String), bool> isSplitwiseMap = {};

    for (final s in splits) {
      final key = (s.personId.value, s.paidFor.value);

      groupedAmounts.update(key, (val) => val + s.amount.value,
          ifAbsent: () => s.amount.value);

      if (s.isSplitwise.value) {
        isSplitwiseMap[key] = true;
      }
    }

    return groupedAmounts.entries.map((entry) {
      final (personId, paidFor) = entry.key;
      final amount = entry.value;

      return SplitItemsCompanion(
        id: Value(const Uuid().v4()),
        transactionId: Value(txnId),
        amount: Value(amount),
        personId: Value(personId),
        paidFor: Value(paidFor),
        isSplitwise: Value(isSplitwiseMap[entry.key] ?? false),
      );
    }).toList();
  }


  Future<TransactionWithEverything> _mapFullTransactions(Transaction txn) async {
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
