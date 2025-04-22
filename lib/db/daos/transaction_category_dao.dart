import 'package:drift/drift.dart';
import 'package:expense_tracker_app/db/tables/transaction_categories.dart';
import '../app_database.dart';
import '../tables/sources.dart';

part 'transaction_category_dao.g.dart';

@DriftAccessor(tables: [TransactionCategories])
class TransactionCategoryDao extends DatabaseAccessor<AppDatabase> with _$TransactionCategoryDaoMixin {
  TransactionCategoryDao(super.db);

  Future<List<TransactionCategory>> getAllTransactionCategory() => select(transactionCategories).get();

  Stream<List<TransactionCategory>> watchAllTransactionCategory() => select(transactionCategories).watch();

  Future<TransactionCategory> getTransactionCategoryById(String id) async {
    final row = await (select(transactionCategories)..where((t) => t.id.equals(id))).getSingleOrNull();
    if (row == null) {
      throw Exception("Transaction category with id $id not found");
    }
    return row;
  }

  Future<void> insertTransactionCategory(TransactionCategoriesCompanion tc) =>
      into(transactionCategories).insert(tc, mode: InsertMode.insertOrReplace);

  Future<void> deleteTransactionCategory(String id) =>
      (delete(transactionCategories)..where((tbl) => tbl.id.equals(id))).go();
}
