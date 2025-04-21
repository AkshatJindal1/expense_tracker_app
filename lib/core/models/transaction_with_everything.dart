import 'package:expense_tracker_app/core/models/source_with_everything.dart';
import 'package:expense_tracker_app/db/app_database.dart';

class TransactionWithSplits {
  final Transaction transaction;
  final List<SplitItem> splits;

  TransactionWithSplits({required this.transaction, required this.splits});
}

class SplitItemWithPerson {
  final SplitItem split;
  final Person? person;

  SplitItemWithPerson({required this.split, this.person});
}

class TransactionWithEverything {
  final Transaction txn;
  final TransactionType? transactionType;
  final SourceWithEverything? source;
  final SourceWithEverything? destination;
  final SourceWithEverything? feeSource;
  final TransactionCategory? transactionCategory;
  final List<SplitItemWithPerson> splits;

  final SourceWithEverything? incomeSource;
  final InvestmentType? investmentType;

  TransactionWithEverything({
    required this.txn,
    this.transactionType,
    this.source,
    this.destination,
    this.feeSource,
    this.transactionCategory,
    required this.splits,
    this.incomeSource,
    this.investmentType
  });
}
