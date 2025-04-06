// Native Dart enums (no json_serializable needed)

enum PaidFor {
  self,
  someoneElse,
}

enum TransactionType {
  expense,
  income,
  transfer,
  investment,
  adjustment,
}

enum NeedType {
  need,
  want,
}

enum SourceType {
  bank,
  wallet,
  creditCard,
  splitwise,
}
