import 'package:drift/drift.dart';

class SourceCategories extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()(); // Income OR Expense.

  @override
  Set<Column> get primaryKey => {id};
}