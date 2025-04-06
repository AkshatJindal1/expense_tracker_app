import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:expense_tracker_app/db/app_database.dart';
import 'package:expense_tracker_app/core/models/enums.dart';

final _uuid = Uuid();

Future<void> insertSampleData(AppDatabase db) async {
  // Insert sources
  final hdfcBankId = _uuid.v4();
  await db.into(db.sources).insert(SourcesCompanion(
    id: Value(hdfcBankId),
    name: Value('HDFC Bank'),
    type: Value(SourceType.bank.name),
    isVirtual: const Value(false),
  ));

  final splitwiseSourceId = _uuid.v4();
  await db.into(db.sources).insert(SourcesCompanion(
    id: Value(splitwiseSourceId),
    name: Value(SourceType.splitwise.name),
    type: Value('Virtual'),
    isVirtual: const Value(true),
  ));

  // Insert person
  final rahulId = _uuid.v4();
  await db.into(db.persons).insert(PersonsCompanion(
    id: Value(rahulId),
    name: Value('Rahul'),
  ));

  // Insert transaction
  final txnId = _uuid.v4();
  await db.into(db.transactions).insert(TransactionsCompanion(
    id: Value(txnId),
    transactionType: Value(TransactionType.expense.name),
    amount: Value(300),
    sourceId: Value(hdfcBankId),
    category: Value('Food'),
    note: Value('Dinner with Rahul'),
    timestamp: Value(DateTime.now()),
    needType: Value(NeedType.want.name),
  ));

  // Insert split items
  await db.into(db.splitItems).insert(SplitItemsCompanion(
    id: Value(_uuid.v4()),
    transactionId: Value(txnId),
    amount: Value(150),
    paidFor: Value(PaidFor.self.name),
    isSplitwise: const Value(false),
  ));

  await db.into(db.splitItems).insert(SplitItemsCompanion(
    id: Value(_uuid.v4()),
    transactionId: Value(txnId),
    amount: Value(150),
    paidFor: Value(PaidFor.someoneElse.name),
    personId: Value(rahulId),
    isSplitwise: const Value(true),
  ));
}
