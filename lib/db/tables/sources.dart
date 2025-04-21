import 'package:drift/drift.dart';
import 'package:expense_tracker_app/db/tables/source_categories.dart';
import 'package:expense_tracker_app/db/tables/source_types.dart';

// import 'package:expense_tracker_app/core/models/enums.dart';

class Sources extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()(); // e.g., HDFC Bank, PhonePe Wallet

  @ReferenceName('sourceType')
  TextColumn get sourceTypeId => text().references(SourceTypes, #id)(); // e.g., Bank, Wallet, CreditCard, Splitwise

  @ReferenceName('sourceCategory')
  TextColumn get sourceCategoryId => text().references(SourceCategories, #id)();

  BoolColumn get isVirtual => boolean().withDefault(const Constant(false))(); // For Splitwise, etc.

  @override
  Set<Column> get primaryKey => {id};
}
