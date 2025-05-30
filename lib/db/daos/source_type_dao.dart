
import 'package:drift/drift.dart';
import 'package:expense_tracker_app/db/tables/source_types.dart';
import '../app_database.dart';

part 'source_type_dao.g.dart';

@DriftAccessor(tables: [SourceTypes])
class SourceTypeDao extends DatabaseAccessor<AppDatabase> with _$SourceTypeDaoMixin {
  SourceTypeDao(super.db);

  Future<List<SourceType>> getAllSourceType() => select(sourceTypes).get();

  Stream<List<SourceType>> watchAllSourceType() => select(sourceTypes).watch();

  Future<void> insertSourceType(SourceTypesCompanion sourceType) =>
      into(sourceTypes).insert(sourceType, mode: InsertMode.insertOrReplace);

  Future<void> deleteSourceType(String id) =>
      (delete(sourceTypes)..where((tbl) => tbl.id.equals(id))).go();
}
