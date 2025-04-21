
import 'package:drift/drift.dart';
import 'package:expense_tracker_app/db/tables/persons.dart';
import '../app_database.dart';

part 'person_dao.g.dart';

@DriftAccessor(tables: [Persons])
class PersonDao extends DatabaseAccessor<AppDatabase> with _$PersonDaoMixin {
  PersonDao(super.db);

  Future<List<Person>> getAllPersons() => select(persons).get();

  Stream<List<Person>> watchAllPersons() => select(persons).watch();

  Future<void> insertSource(PersonsCompanion person) =>
      into(persons).insert(person, mode: InsertMode.insertOrReplace);

  Future<void> deleteSource(String id) =>
      (delete(persons)..where((tbl) => tbl.id.equals(id))).go();
}
