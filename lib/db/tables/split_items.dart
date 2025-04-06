import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import 'package:expense_tracker_app/core/models/enums.dart';

class SplitItems extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();

  TextColumn get transactionId => text()(); // FK to Transactions table

  RealColumn get amount => real()();

  TextColumn get paidFor => text().check(
    paidFor.isIn(PaidFor.values.map((e) => e.name).toList()))();

  TextColumn get personId => text().nullable()(); // Optional FK for lending

  BoolColumn get isSplitwise => boolean().withDefault(const Constant(false))();

  TextColumn get category => text().nullable()(); // Optional override

  @override
  Set<Column> get primaryKey => {id};
}
