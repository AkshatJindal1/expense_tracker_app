// Native Dart enums (no json_serializable needed)

enum PaidFor {
  self('Self'),
  someoneElse('Someone else');

  final String label;

  const PaidFor(this.label);
}

enum TransactionType {
  expense('Expense'),
  income('Income'),
  transfer('Transfer'),
  investment('Investment'),
  adjustment('Adjustment');

  final String label;

  const TransactionType(this.label);
}

enum NeedType {
  need('Need'),
  want('Want');

  final String label;

  const NeedType(this.label);
}


enum SourceType {
  bank('Bank'),
  wallet('Wallet'),
  creditCard('Credit Card'),
  splitwise('Splitwise');

  final String label;

  const SourceType(this.label);
}

