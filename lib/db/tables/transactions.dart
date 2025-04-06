import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class Transactions extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();

  TextColumn get transactionType => text()(); // Expense, Transfer, Income, Investment, Adjustment

  RealColumn get amount => real()(); // The main amount involved

  TextColumn get sourceId => text()(); // Fund source from which money is deducted or added

  TextColumn get toSourceId => text().nullable()(); // Destination source (for transfers)

  RealColumn get fee => real().nullable()(); // Optional fee amount for transfers

  TextColumn get feeSourceId => text().nullable()(); // Fee source if different

  TextColumn get category => text().nullable()(); // Category for expenses/investments

  TextColumn get note => text().nullable()();

  DateTimeColumn get timestamp => dateTime()(); // When the transaction occurred

  TextColumn get incomeSource => text().nullable()(); // For income

  TextColumn get investmentType => text().nullable()(); // For investments

  @override
  Set<Column> get primaryKey => {id};
}

