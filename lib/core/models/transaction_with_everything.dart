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
  final Source? source;
  final Source? destination;
  final Source? feeSource;
  final List<SplitItemWithPerson> splits;

  TransactionWithEverything({
    required this.txn,
    this.source,
    this.destination,
    this.feeSource,
    required this.splits,
  });
}
