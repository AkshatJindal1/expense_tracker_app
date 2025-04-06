import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:expense_tracker_app/db/tables/sources.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

import 'tables/split_items.dart';
import 'tables/transactions.dart';
import 'tables/sources.dart';
import 'tables/persons.dart';
import 'daos/transaction_dao.dart';

part 'app_database.g.dart'; // will be generated

@DriftDatabase(tables: [SplitItems, Transactions, Sources, Persons], daos: [TransactionDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'expense_tracker.sqlite'));
    return NativeDatabase(file);
  });
}

