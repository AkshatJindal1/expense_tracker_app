import 'package:drift/drift.dart';

import 'package:expense_tracker_app/db/tables/sources.dart';


class Transactions extends Table {
  TextColumn get id => text()();

  TextColumn get transactionType => text()();

  RealColumn get amount => real()(); // The main amount involved

  @ReferenceName('source')
  TextColumn get sourceId => text().references(Sources, #id)(); // Fund source from which money is deducted or added

  @ReferenceName('destinationSource')
  TextColumn get toSourceId => text().nullable().references(Sources, #id)(); // Destination source (for transfers)

  RealColumn get fee => real().nullable()(); // Optional fee amount for transfers

  @ReferenceName('feeSource')
  TextColumn get feeSourceId => text().nullable().references(Sources, #id)(); // Fee source if different

  TextColumn get category => text().nullable()(); // Category for expenses/investments

  TextColumn get needType => text().nullable()();

  TextColumn get note => text().nullable()();

  DateTimeColumn get timestamp => dateTime()(); // When the transaction occurred

  TextColumn get incomeSource => text().nullable()(); // For income

  TextColumn get investmentType => text().nullable()(); // For investments

  @override
  Set<Column> get primaryKey => {id};
}

