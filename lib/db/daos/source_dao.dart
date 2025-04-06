import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/sources.dart';

part 'source_dao.g.dart';

@DriftAccessor(tables: [Sources])
class SourceDao extends DatabaseAccessor<AppDatabase> with _$SourceDaoMixin {
  SourceDao(super.db);

  Future<List<Source>> getAllSources() => select(sources).get();

  Stream<List<Source>> watchAllSources() => select(sources).watch();

  Future<void> insertSource(SourcesCompanion source) =>
      into(sources).insert(source, mode: InsertMode.insertOrReplace);

  Future<void> deleteSource(String id) =>
      (delete(sources)..where((tbl) => tbl.id.equals(id))).go();
}
