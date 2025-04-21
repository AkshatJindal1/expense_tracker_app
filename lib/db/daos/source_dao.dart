import 'package:drift/drift.dart';
import 'package:expense_tracker_app/core/models/source_with_everything.dart';
import '../app_database.dart';
import '../tables/sources.dart';

part 'source_dao.g.dart';

@DriftAccessor(tables: [Sources])
class SourceDao extends DatabaseAccessor<AppDatabase> with _$SourceDaoMixin {
  SourceDao(super.db);

  Future<List<SourceWithEverything>> getAllSources() async {
    final sourceRows = await select(sources).get();
    return Future.wait(sourceRows.map(_mapFullSource).toList());
  }

  Stream<List<SourceWithEverything>> watchAllSources() {
    return select(sources).watch().asyncMap((s) async {
      return Future.wait(s.map(_mapFullSource).toList());
    });
  }

  Future<SourceWithEverything> getSourceById(String id) async {
    final row = await (select(sources)..where((s) => s.id.equals(id))).getSingleOrNull();
    if (row == null) {
      throw Exception("Source with id $id not found");
    }
    return await _mapFullSource(row);
  }

  Future<void> insertSource(SourcesCompanion source) =>
      into(sources).insert(source, mode: InsertMode.insertOrReplace);

  Future<void> deleteSource(String id) =>
      (delete(sources)..where((tbl) => tbl.id.equals(id))).go();
  
  Future<SourceWithEverything> _mapFullSource(Source source) async {
    final sType = await (select(sourceTypes)..where((s) => s.id.equals(source.sourceTypeId))).getSingleOrNull();
    final sCategory = await (select(sourceCategories)..where((s) => s.id.equals(source.sourceCategoryId))).getSingleOrNull();

    return SourceWithEverything(source: source, sourceType: sType, sourceCategory: sCategory);
  }
}
