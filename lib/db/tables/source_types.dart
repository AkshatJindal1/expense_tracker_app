import 'package:drift/drift.dart';

class SourceTypes extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()(); // e.g., Bank, Wallet, CreditCard, Splitwise

  @override
  Set<Column> get primaryKey => {id};
}