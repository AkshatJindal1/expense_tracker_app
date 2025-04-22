import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:expense_tracker_app/db/app_database.dart';
import 'package:expense_tracker_app/core/models/enums.dart';

final _uuid = Uuid();

Future<void> insertSampleData(AppDatabase db) async {
  // Clear existing data first
  await db.delete(db.splitItems).go();
  await db.delete(db.transactions).go();
  await db.delete(db.sources).go();
  await db.delete(db.persons).go();
  await db.delete(db.investmentTypes).go();
  await db.delete(db.sourceCategories).go();
  await db.delete(db.sourceTypes).go();
  await db.delete(db.transactionCategories).go();
  await db.delete(db.transactionTypes).go();

  // Insert Source Category
  final incomeCategoryId = _uuid.v4();
  await db.into(db.sourceCategories).insert(SourceCategoriesCompanion(
    id: Value(incomeCategoryId), name: Value("Income")
  ));

  final expenseCategoryId = _uuid.v4();
  await db.into(db.sourceCategories).insert(SourceCategoriesCompanion(
    id: Value(expenseCategoryId), name: Value("Expense")
  ));

  // Insert source type.
  final bankTyepId = _uuid.v4();
  await db.into(db.sourceTypes).insert(SourceTypesCompanion(
    id: Value(bankTyepId), name: Value("Bank")
  ));
  final walletTyepId = _uuid.v4();
  await db.into(db.sourceTypes).insert(SourceTypesCompanion(
    id: Value(walletTyepId), name: Value("Wallet")
  ));
  final creditCardTyepId = _uuid.v4();
  await db.into(db.sourceTypes).insert(SourceTypesCompanion(
    id: Value(creditCardTyepId), name: Value("Credit Card")
  ));
  final splitwiseTyepId = _uuid.v4();
  await db.into(db.sourceTypes).insert(SourceTypesCompanion(
    id: Value(splitwiseTyepId), name: Value("Splitwise")
  ));

  // Insert sources
  final hdfcBankId = _uuid.v4();
  await db.into(db.sources).insert(SourcesCompanion(
    id: Value(hdfcBankId),
    name: Value('HDFC Bank'),
    sourceTypeId: Value(bankTyepId),
    sourceCategoryId: Value(expenseCategoryId),
    isVirtual: const Value(false),
  ));

  final splitwiseSourceId = _uuid.v4();
  await db.into(db.sources).insert(SourcesCompanion(
    id: Value(splitwiseSourceId),
    name: Value('Splitwise'),
    sourceTypeId: Value(splitwiseTyepId),
    sourceCategoryId: Value(expenseCategoryId),
    isVirtual: const Value(true),
  ));

  final regaliaCcSourceId = _uuid.v4();
  await db.into(db.sources).insert(SourcesCompanion(
    id: Value(regaliaCcSourceId),
    name: Value('Regalia Gold Credit Card'),
    sourceTypeId: Value(creditCardTyepId),
    sourceCategoryId: Value(expenseCategoryId),
    isVirtual: const Value(true),
  ));

  // Insert person
  final abhilashaId = _uuid.v4();
  await db.into(db.persons).insert(PersonsCompanion(
    id: Value(abhilashaId),
    name: Value('Abhilasha'),
  ));

  // Insert Transaction Type
  final expenseTypeId = 'expense';
  await db.into(db.transactionTypes).insert(TransactionTypesCompanion(
    id: Value(expenseTypeId),
    name: Value('Expense'),
  ));
  final investmentTyepId = 'investment';
  await db.into(db.transactionTypes).insert(TransactionTypesCompanion(
    id: Value(investmentTyepId),
    name: Value('Investment'),
  ));
  final transferTypeId = 'transfer';
  await db.into(db.transactionTypes).insert(TransactionTypesCompanion(
    id: Value(transferTypeId),
    name: Value('Transfer'),
  ));
  final incomeTypeId = 'income';
  await db.into(db.transactionTypes).insert(TransactionTypesCompanion(
    id: Value(incomeTypeId),
    name: Value('Income'),
  ));
  final adjustmentTypeId = 'adjustment';
  await db.into(db.transactionTypes).insert(TransactionTypesCompanion(
    id: Value(adjustmentTypeId),
    name: Value('Adjustment'),
  ));
  
  // Insert transaction category.
  final travelCatId = _uuid.v4();
  await db.into(db.transactionCategories).insert(TransactionCategoriesCompanion(
    id: Value(travelCatId),
    name: Value('Travel'),
  ));
  final groceryCatId = _uuid.v4();
  await db.into(db.transactionCategories).insert(TransactionCategoriesCompanion(
    id: Value(groceryCatId),
    name: Value('Grocery'),
  ));
  final investmentCatid = _uuid.v4();
  await db.into(db.transactionCategories).insert(TransactionCategoriesCompanion(
    id: Value(investmentCatid),
    name: Value('Investment'),
  ));
  final householdCatid = _uuid.v4();
  await db.into(db.transactionCategories).insert(TransactionCategoriesCompanion(
    id: Value(householdCatid),
    name: Value('Household'),
  ));
  final foodCatid = _uuid.v4();
  await db.into(db.transactionCategories).insert(TransactionCategoriesCompanion(
    id: Value(foodCatid),
    name: Value('Food'),
  ));


  // Insert transaction
  final txnId = _uuid.v4();
  await db.into(db.transactions).insert(TransactionsCompanion(
    id: Value(txnId),
    transactionTypeId: Value(expenseTypeId),
    amount: Value(300),
    sourceId: Value(hdfcBankId),
    categoryId: Value(foodCatid),
    note: Value('Dinner with Abhilasha'),
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
    personId: Value(abhilashaId),
    isSplitwise: const Value(true),
  ));

  await db.into(db.investmentTypes).insert(InvestmentTypesCompanion(
    id: Value(_uuid.v4()),
    name: const Value("SIP"),
  ));
  await db.into(db.investmentTypes).insert(InvestmentTypesCompanion(
    id: Value(_uuid.v4()),
    name: const Value("Stock"),
  ));
  await db.into(db.investmentTypes).insert(InvestmentTypesCompanion(
    id: Value(_uuid.v4()),
    name: const Value("Lumpsum"),
  ));
  await db.into(db.investmentTypes).insert(InvestmentTypesCompanion(
    id: Value(_uuid.v4()),
    name: const Value("Gold"),
  ));
  await db.into(db.investmentTypes).insert(InvestmentTypesCompanion(
    id: Value(_uuid.v4()),
    name: const Value("Cryptocurrency"),
  ));
}
