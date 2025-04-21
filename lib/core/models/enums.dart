// Native Dart enums (no json_serializable needed)

enum PaidFor {
  self('Self'),
  someoneElse('Someone else');

  final String label;

  const PaidFor(this.label);
}


enum NeedType {
  need('Need'),
  want('Want');

  final String label;

  const NeedType(this.label);
}

