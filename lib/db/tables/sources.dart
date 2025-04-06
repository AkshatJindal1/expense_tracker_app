import 'package:drift/drift.dart';

import 'package:expense_tracker_app/core/models/enums.dart';

class Sources extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()(); // e.g., HDFC Bank, PhonePe Wallet

  TextColumn get type => text()(); // e.g., Bank, Wallet, CreditCard, Splitwise

  BoolColumn get isVirtual => boolean().withDefault(const Constant(false))(); // For Splitwise, etc.

  @override
  Set<Column> get primaryKey => {id};
}
