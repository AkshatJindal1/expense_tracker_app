import 'package:drift/drift.dart';

import 'package:expense_tracker_app/db/tables/persons.dart';
import 'package:expense_tracker_app/db/tables/transactions.dart';


class SplitItems extends Table {
  TextColumn get id => text()();

  @ReferenceName('transaction')
  TextColumn get transactionId => text().references(Transactions, #id,onDelete: KeyAction.cascade)(); // FK to Transactions table

  RealColumn get amount => real()();

  TextColumn get paidFor => text()();

  @ReferenceName('person')
  TextColumn get personId => text().nullable().references(Persons, #id)(); // Optional FK for lending

  BoolColumn get isSplitwise => boolean().withDefault(const Constant(false))();

  TextColumn get category => text().nullable()(); // Optional override

  @override
  Set<Column> get primaryKey => {id};
}
