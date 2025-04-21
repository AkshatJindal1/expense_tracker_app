import 'package:drift/drift.dart';
import 'package:expense_tracker_app/db/tables/investment_types.dart';

import 'package:expense_tracker_app/db/tables/sources.dart';
import 'package:expense_tracker_app/db/tables/transaction_categories.dart';
import 'package:expense_tracker_app/db/tables/transaction_types.dart';


class Transactions extends Table {
  TextColumn get id => text()();

  @ReferenceName('transactionType')
  TextColumn get transactionTypeId => text().references(TransactionTypes, #id)(); // Expense, Investment, Transfer, Income, Adjustment

  RealColumn get amount => real()(); // The main amount involved

  @ReferenceName('source')
  TextColumn get sourceId => text().references(Sources, #id)(); // Fund source from which money is deducted or added

  @ReferenceName('destinationSource')
  TextColumn get toSourceId => text().nullable().references(Sources, #id)(); // Destination source (for transfers)

  RealColumn get fee => real().nullable()(); // Optional fee amount for transfers

  @ReferenceName('feeSource')
  TextColumn get feeSourceId => text().nullable().references(Sources, #id)(); // Fee source if different

  @ReferenceName('category')
  TextColumn get categoryId => text().nullable().references(TransactionCategories, #id)(); // Category for expenses/investments

  TextColumn get needType => text().nullable()();

  TextColumn get note => text().nullable()();

  DateTimeColumn get timestamp => dateTime()(); // When the transaction occurred

  @ReferenceName('incomeSource')
  TextColumn get incomeSourceId => text().nullable().references(Sources, #id)(); // For income

  @ReferenceName('investmentType')
  TextColumn get investmentTypeId => text().nullable().references(InvestmentTypes, #id)(); // For investments

  @override
  Set<Column> get primaryKey => {id};
}

