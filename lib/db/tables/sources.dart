import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import 'package:expense_tracker_app/core/models/enums.dart';

class Sources extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();

  TextColumn get name => text()(); // e.g., HDFC Bank, PhonePe Wallet

  TextColumn get type => text().check(
    type.isIn(SourceType.values.map((e) => e.name).toList()))(); // e.g., Bank, Wallet, CreditCard, Splitwise

  BoolColumn get isVirtual => boolean().withDefault(const Constant(false))(); // For Splitwise, etc.

  @override
  Set<Column> get primaryKey => {id};
}
