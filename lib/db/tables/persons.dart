import 'package:drift/drift.dart';

class Persons extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get phone => text().nullable()(); // Optional contact info.

  @override
  Set<Column> get primaryKey => {id};
}