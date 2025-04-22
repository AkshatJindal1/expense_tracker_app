
import 'package:drift/drift.dart';
import 'package:expense_tracker_app/db/tables/investment_types.dart';
import 'package:expense_tracker_app/db/tables/source_types.dart';
import '../app_database.dart';

part 'investment_type_dao.g.dart';

@DriftAccessor(tables: [InvestmentTypes])
class InvestmentTypeDao extends DatabaseAccessor<AppDatabase> with _$InvestmentTypeDaoMixin {
  InvestmentTypeDao(super.db);

  Future<List<InvestmentType>> getAllInvestmentType() => select(investmentTypes).get();

  Stream<List<InvestmentType>> watchAllInvestmentType() => select(investmentTypes).watch();

  Future<void> insertInvestmentType(InvestmentTypesCompanion it) =>
      into(investmentTypes).insert(it, mode: InsertMode.insertOrReplace);

  Future<void> deleteInvestmentType(String id) =>
      (delete(investmentTypes)..where((tbl) => tbl.id.equals(id))).go();
}
