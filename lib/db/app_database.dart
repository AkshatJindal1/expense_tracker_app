import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:expense_tracker_app/db/tables/split_items.dart';
import 'package:expense_tracker_app/db/tables/transactions.dart';
import 'package:expense_tracker_app/db/tables/sources.dart';
import 'package:expense_tracker_app/db/tables/persons.dart';
import 'package:expense_tracker_app/db/tables/source_types.dart';
import 'package:expense_tracker_app/db/tables/source_categories.dart';
import 'package:expense_tracker_app/db/tables/transaction_categories.dart';
import 'package:expense_tracker_app/db/tables/transaction_types.dart';
import 'package:expense_tracker_app/db/tables/investment_types.dart';

import 'package:expense_tracker_app/db/daos/transaction_dao.dart';
import 'package:expense_tracker_app/db/daos/source_dao.dart';
import 'package:expense_tracker_app/db/daos/person_dao.dart';
import 'package:expense_tracker_app/db/daos/source_type_dao.dart';
import 'package:expense_tracker_app/db/daos/transaction_category_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    SplitItems,
    Transactions,
    Sources,
    Persons,
    SourceTypes,
    SourceCategories,
    TransactionCategories,
    TransactionTypes,
    InvestmentTypes,
  ],
  daos: [
    TransactionDao,
    SourceDao,
    PersonDao,
    SourceTypeDao,
    TransactionCategoryDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // late final sourceDao = SourceDao(this);
  // late final transactionDao = TransactionDao(this, sourceDao);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (m, from, to) async {
      // define upgrade logic or simply recreate
      await m.createAll(); // use with caution (deletes all)
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'expense_tracker.sqlite'));
    if (await file.exists()) {
      await file.delete(); // 🔥 force wipe existing DB
    }

    return NativeDatabase(file);
  });
}
