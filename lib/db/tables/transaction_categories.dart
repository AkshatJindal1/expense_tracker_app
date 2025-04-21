import 'package:drift/drift.dart';

class TransactionCategories extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()(); // Grocery, Travel etc.

  @override
  Set<Column> get primaryKey => {id};
}