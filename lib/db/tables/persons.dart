import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import 'package:expense_tracker_app/core/models/enums.dart';

class Persons extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();

  TextColumn get name => text()();

  TextColumn get phone => text().nullable()(); // Optional contact info.

  @override
  Set<Column> get primaryKey => {id};
}