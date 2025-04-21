import 'package:drift/drift.dart';

class InvestmentTypes extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()(); // e.g., SIP, Lumpsum, Gold, Stock, Crypto.

  @override
  Set<Column> get primaryKey => {id};
}