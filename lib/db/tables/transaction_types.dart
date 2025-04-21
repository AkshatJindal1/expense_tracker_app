import 'package:drift/drift.dart';

class TransactionTypes extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}

