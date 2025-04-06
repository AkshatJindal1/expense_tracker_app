// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SplitItemsTable extends SplitItems
    with TableInfo<$SplitItemsTable, SplitItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SplitItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _transactionIdMeta = const VerificationMeta(
    'transactionId',
  );
  @override
  late final GeneratedColumn<String> transactionId = GeneratedColumn<String>(
    'transaction_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paidForMeta = const VerificationMeta(
    'paidFor',
  );
  @override
  late final GeneratedColumn<String> paidFor = GeneratedColumn<String>(
    'paid_for',
    aliasedName,
    false,
    check: () => paidFor.isIn(PaidFor.values.map((e) => e.name).toList()),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSplitwiseMeta = const VerificationMeta(
    'isSplitwise',
  );
  @override
  late final GeneratedColumn<bool> isSplitwise = GeneratedColumn<bool>(
    'is_splitwise',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_splitwise" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    transactionId,
    amount,
    paidFor,
    personId,
    isSplitwise,
    category,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'split_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<SplitItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
        _transactionIdMeta,
        transactionId.isAcceptableOrUnknown(
          data['transaction_id']!,
          _transactionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('paid_for')) {
      context.handle(
        _paidForMeta,
        paidFor.isAcceptableOrUnknown(data['paid_for']!, _paidForMeta),
      );
    } else if (isInserting) {
      context.missing(_paidForMeta);
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    }
    if (data.containsKey('is_splitwise')) {
      context.handle(
        _isSplitwiseMeta,
        isSplitwise.isAcceptableOrUnknown(
          data['is_splitwise']!,
          _isSplitwiseMeta,
        ),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SplitItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SplitItem(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      transactionId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}transaction_id'],
          )!,
      amount:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}amount'],
          )!,
      paidFor:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}paid_for'],
          )!,
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_id'],
      ),
      isSplitwise:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_splitwise'],
          )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
    );
  }

  @override
  $SplitItemsTable createAlias(String alias) {
    return $SplitItemsTable(attachedDatabase, alias);
  }
}

class SplitItem extends DataClass implements Insertable<SplitItem> {
  final String id;
  final String transactionId;
  final double amount;
  final String paidFor;
  final String? personId;
  final bool isSplitwise;
  final String? category;
  const SplitItem({
    required this.id,
    required this.transactionId,
    required this.amount,
    required this.paidFor,
    this.personId,
    required this.isSplitwise,
    this.category,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['transaction_id'] = Variable<String>(transactionId);
    map['amount'] = Variable<double>(amount);
    map['paid_for'] = Variable<String>(paidFor);
    if (!nullToAbsent || personId != null) {
      map['person_id'] = Variable<String>(personId);
    }
    map['is_splitwise'] = Variable<bool>(isSplitwise);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    return map;
  }

  SplitItemsCompanion toCompanion(bool nullToAbsent) {
    return SplitItemsCompanion(
      id: Value(id),
      transactionId: Value(transactionId),
      amount: Value(amount),
      paidFor: Value(paidFor),
      personId:
          personId == null && nullToAbsent
              ? const Value.absent()
              : Value(personId),
      isSplitwise: Value(isSplitwise),
      category:
          category == null && nullToAbsent
              ? const Value.absent()
              : Value(category),
    );
  }

  factory SplitItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SplitItem(
      id: serializer.fromJson<String>(json['id']),
      transactionId: serializer.fromJson<String>(json['transactionId']),
      amount: serializer.fromJson<double>(json['amount']),
      paidFor: serializer.fromJson<String>(json['paidFor']),
      personId: serializer.fromJson<String?>(json['personId']),
      isSplitwise: serializer.fromJson<bool>(json['isSplitwise']),
      category: serializer.fromJson<String?>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'transactionId': serializer.toJson<String>(transactionId),
      'amount': serializer.toJson<double>(amount),
      'paidFor': serializer.toJson<String>(paidFor),
      'personId': serializer.toJson<String?>(personId),
      'isSplitwise': serializer.toJson<bool>(isSplitwise),
      'category': serializer.toJson<String?>(category),
    };
  }

  SplitItem copyWith({
    String? id,
    String? transactionId,
    double? amount,
    String? paidFor,
    Value<String?> personId = const Value.absent(),
    bool? isSplitwise,
    Value<String?> category = const Value.absent(),
  }) => SplitItem(
    id: id ?? this.id,
    transactionId: transactionId ?? this.transactionId,
    amount: amount ?? this.amount,
    paidFor: paidFor ?? this.paidFor,
    personId: personId.present ? personId.value : this.personId,
    isSplitwise: isSplitwise ?? this.isSplitwise,
    category: category.present ? category.value : this.category,
  );
  SplitItem copyWithCompanion(SplitItemsCompanion data) {
    return SplitItem(
      id: data.id.present ? data.id.value : this.id,
      transactionId:
          data.transactionId.present
              ? data.transactionId.value
              : this.transactionId,
      amount: data.amount.present ? data.amount.value : this.amount,
      paidFor: data.paidFor.present ? data.paidFor.value : this.paidFor,
      personId: data.personId.present ? data.personId.value : this.personId,
      isSplitwise:
          data.isSplitwise.present ? data.isSplitwise.value : this.isSplitwise,
      category: data.category.present ? data.category.value : this.category,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SplitItem(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('amount: $amount, ')
          ..write('paidFor: $paidFor, ')
          ..write('personId: $personId, ')
          ..write('isSplitwise: $isSplitwise, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    transactionId,
    amount,
    paidFor,
    personId,
    isSplitwise,
    category,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SplitItem &&
          other.id == this.id &&
          other.transactionId == this.transactionId &&
          other.amount == this.amount &&
          other.paidFor == this.paidFor &&
          other.personId == this.personId &&
          other.isSplitwise == this.isSplitwise &&
          other.category == this.category);
}

class SplitItemsCompanion extends UpdateCompanion<SplitItem> {
  final Value<String> id;
  final Value<String> transactionId;
  final Value<double> amount;
  final Value<String> paidFor;
  final Value<String?> personId;
  final Value<bool> isSplitwise;
  final Value<String?> category;
  final Value<int> rowid;
  const SplitItemsCompanion({
    this.id = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.amount = const Value.absent(),
    this.paidFor = const Value.absent(),
    this.personId = const Value.absent(),
    this.isSplitwise = const Value.absent(),
    this.category = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SplitItemsCompanion.insert({
    this.id = const Value.absent(),
    required String transactionId,
    required double amount,
    required String paidFor,
    this.personId = const Value.absent(),
    this.isSplitwise = const Value.absent(),
    this.category = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : transactionId = Value(transactionId),
       amount = Value(amount),
       paidFor = Value(paidFor);
  static Insertable<SplitItem> custom({
    Expression<String>? id,
    Expression<String>? transactionId,
    Expression<double>? amount,
    Expression<String>? paidFor,
    Expression<String>? personId,
    Expression<bool>? isSplitwise,
    Expression<String>? category,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transactionId != null) 'transaction_id': transactionId,
      if (amount != null) 'amount': amount,
      if (paidFor != null) 'paid_for': paidFor,
      if (personId != null) 'person_id': personId,
      if (isSplitwise != null) 'is_splitwise': isSplitwise,
      if (category != null) 'category': category,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SplitItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? transactionId,
    Value<double>? amount,
    Value<String>? paidFor,
    Value<String?>? personId,
    Value<bool>? isSplitwise,
    Value<String?>? category,
    Value<int>? rowid,
  }) {
    return SplitItemsCompanion(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      amount: amount ?? this.amount,
      paidFor: paidFor ?? this.paidFor,
      personId: personId ?? this.personId,
      isSplitwise: isSplitwise ?? this.isSplitwise,
      category: category ?? this.category,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<String>(transactionId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (paidFor.present) {
      map['paid_for'] = Variable<String>(paidFor.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (isSplitwise.present) {
      map['is_splitwise'] = Variable<bool>(isSplitwise.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SplitItemsCompanion(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('amount: $amount, ')
          ..write('paidFor: $paidFor, ')
          ..write('personId: $personId, ')
          ..write('isSplitwise: $isSplitwise, ')
          ..write('category: $category, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _transactionTypeMeta = const VerificationMeta(
    'transactionType',
  );
  @override
  late final GeneratedColumn<String> transactionType = GeneratedColumn<String>(
    'transaction_type',
    aliasedName,
    false,
    check:
        () => transactionType.isIn(
          TransactionType.values.map((e) => e.name).toList(),
        ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
    'source_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _toSourceIdMeta = const VerificationMeta(
    'toSourceId',
  );
  @override
  late final GeneratedColumn<String> toSourceId = GeneratedColumn<String>(
    'to_source_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _feeMeta = const VerificationMeta('fee');
  @override
  late final GeneratedColumn<double> fee = GeneratedColumn<double>(
    'fee',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _feeSourceIdMeta = const VerificationMeta(
    'feeSourceId',
  );
  @override
  late final GeneratedColumn<String> feeSourceId = GeneratedColumn<String>(
    'fee_source_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _needTypeMeta = const VerificationMeta(
    'needType',
  );
  @override
  late final GeneratedColumn<String> needType = GeneratedColumn<String>(
    'need_type',
    aliasedName,
    true,
    check: () => needType.isIn(NeedType.values.map((e) => e.name).toList()),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _incomeSourceMeta = const VerificationMeta(
    'incomeSource',
  );
  @override
  late final GeneratedColumn<String> incomeSource = GeneratedColumn<String>(
    'income_source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _investmentTypeMeta = const VerificationMeta(
    'investmentType',
  );
  @override
  late final GeneratedColumn<String> investmentType = GeneratedColumn<String>(
    'investment_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    transactionType,
    amount,
    sourceId,
    toSourceId,
    fee,
    feeSourceId,
    category,
    needType,
    note,
    timestamp,
    incomeSource,
    investmentType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Transaction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('transaction_type')) {
      context.handle(
        _transactionTypeMeta,
        transactionType.isAcceptableOrUnknown(
          data['transaction_type']!,
          _transactionTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionTypeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    if (data.containsKey('to_source_id')) {
      context.handle(
        _toSourceIdMeta,
        toSourceId.isAcceptableOrUnknown(
          data['to_source_id']!,
          _toSourceIdMeta,
        ),
      );
    }
    if (data.containsKey('fee')) {
      context.handle(
        _feeMeta,
        fee.isAcceptableOrUnknown(data['fee']!, _feeMeta),
      );
    }
    if (data.containsKey('fee_source_id')) {
      context.handle(
        _feeSourceIdMeta,
        feeSourceId.isAcceptableOrUnknown(
          data['fee_source_id']!,
          _feeSourceIdMeta,
        ),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('need_type')) {
      context.handle(
        _needTypeMeta,
        needType.isAcceptableOrUnknown(data['need_type']!, _needTypeMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('income_source')) {
      context.handle(
        _incomeSourceMeta,
        incomeSource.isAcceptableOrUnknown(
          data['income_source']!,
          _incomeSourceMeta,
        ),
      );
    }
    if (data.containsKey('investment_type')) {
      context.handle(
        _investmentTypeMeta,
        investmentType.isAcceptableOrUnknown(
          data['investment_type']!,
          _investmentTypeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      transactionType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}transaction_type'],
          )!,
      amount:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}amount'],
          )!,
      sourceId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}source_id'],
          )!,
      toSourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}to_source_id'],
      ),
      fee: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fee'],
      ),
      feeSourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fee_source_id'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      needType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}need_type'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      timestamp:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}timestamp'],
          )!,
      incomeSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}income_source'],
      ),
      investmentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}investment_type'],
      ),
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final String id;
  final String transactionType;
  final double amount;
  final String sourceId;
  final String? toSourceId;
  final double? fee;
  final String? feeSourceId;
  final String? category;
  final String? needType;
  final String? note;
  final DateTime timestamp;
  final String? incomeSource;
  final String? investmentType;
  const Transaction({
    required this.id,
    required this.transactionType,
    required this.amount,
    required this.sourceId,
    this.toSourceId,
    this.fee,
    this.feeSourceId,
    this.category,
    this.needType,
    this.note,
    required this.timestamp,
    this.incomeSource,
    this.investmentType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['transaction_type'] = Variable<String>(transactionType);
    map['amount'] = Variable<double>(amount);
    map['source_id'] = Variable<String>(sourceId);
    if (!nullToAbsent || toSourceId != null) {
      map['to_source_id'] = Variable<String>(toSourceId);
    }
    if (!nullToAbsent || fee != null) {
      map['fee'] = Variable<double>(fee);
    }
    if (!nullToAbsent || feeSourceId != null) {
      map['fee_source_id'] = Variable<String>(feeSourceId);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || needType != null) {
      map['need_type'] = Variable<String>(needType);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    if (!nullToAbsent || incomeSource != null) {
      map['income_source'] = Variable<String>(incomeSource);
    }
    if (!nullToAbsent || investmentType != null) {
      map['investment_type'] = Variable<String>(investmentType);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      transactionType: Value(transactionType),
      amount: Value(amount),
      sourceId: Value(sourceId),
      toSourceId:
          toSourceId == null && nullToAbsent
              ? const Value.absent()
              : Value(toSourceId),
      fee: fee == null && nullToAbsent ? const Value.absent() : Value(fee),
      feeSourceId:
          feeSourceId == null && nullToAbsent
              ? const Value.absent()
              : Value(feeSourceId),
      category:
          category == null && nullToAbsent
              ? const Value.absent()
              : Value(category),
      needType:
          needType == null && nullToAbsent
              ? const Value.absent()
              : Value(needType),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      timestamp: Value(timestamp),
      incomeSource:
          incomeSource == null && nullToAbsent
              ? const Value.absent()
              : Value(incomeSource),
      investmentType:
          investmentType == null && nullToAbsent
              ? const Value.absent()
              : Value(investmentType),
    );
  }

  factory Transaction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<String>(json['id']),
      transactionType: serializer.fromJson<String>(json['transactionType']),
      amount: serializer.fromJson<double>(json['amount']),
      sourceId: serializer.fromJson<String>(json['sourceId']),
      toSourceId: serializer.fromJson<String?>(json['toSourceId']),
      fee: serializer.fromJson<double?>(json['fee']),
      feeSourceId: serializer.fromJson<String?>(json['feeSourceId']),
      category: serializer.fromJson<String?>(json['category']),
      needType: serializer.fromJson<String?>(json['needType']),
      note: serializer.fromJson<String?>(json['note']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      incomeSource: serializer.fromJson<String?>(json['incomeSource']),
      investmentType: serializer.fromJson<String?>(json['investmentType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'transactionType': serializer.toJson<String>(transactionType),
      'amount': serializer.toJson<double>(amount),
      'sourceId': serializer.toJson<String>(sourceId),
      'toSourceId': serializer.toJson<String?>(toSourceId),
      'fee': serializer.toJson<double?>(fee),
      'feeSourceId': serializer.toJson<String?>(feeSourceId),
      'category': serializer.toJson<String?>(category),
      'needType': serializer.toJson<String?>(needType),
      'note': serializer.toJson<String?>(note),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'incomeSource': serializer.toJson<String?>(incomeSource),
      'investmentType': serializer.toJson<String?>(investmentType),
    };
  }

  Transaction copyWith({
    String? id,
    String? transactionType,
    double? amount,
    String? sourceId,
    Value<String?> toSourceId = const Value.absent(),
    Value<double?> fee = const Value.absent(),
    Value<String?> feeSourceId = const Value.absent(),
    Value<String?> category = const Value.absent(),
    Value<String?> needType = const Value.absent(),
    Value<String?> note = const Value.absent(),
    DateTime? timestamp,
    Value<String?> incomeSource = const Value.absent(),
    Value<String?> investmentType = const Value.absent(),
  }) => Transaction(
    id: id ?? this.id,
    transactionType: transactionType ?? this.transactionType,
    amount: amount ?? this.amount,
    sourceId: sourceId ?? this.sourceId,
    toSourceId: toSourceId.present ? toSourceId.value : this.toSourceId,
    fee: fee.present ? fee.value : this.fee,
    feeSourceId: feeSourceId.present ? feeSourceId.value : this.feeSourceId,
    category: category.present ? category.value : this.category,
    needType: needType.present ? needType.value : this.needType,
    note: note.present ? note.value : this.note,
    timestamp: timestamp ?? this.timestamp,
    incomeSource: incomeSource.present ? incomeSource.value : this.incomeSource,
    investmentType:
        investmentType.present ? investmentType.value : this.investmentType,
  );
  Transaction copyWithCompanion(TransactionsCompanion data) {
    return Transaction(
      id: data.id.present ? data.id.value : this.id,
      transactionType:
          data.transactionType.present
              ? data.transactionType.value
              : this.transactionType,
      amount: data.amount.present ? data.amount.value : this.amount,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      toSourceId:
          data.toSourceId.present ? data.toSourceId.value : this.toSourceId,
      fee: data.fee.present ? data.fee.value : this.fee,
      feeSourceId:
          data.feeSourceId.present ? data.feeSourceId.value : this.feeSourceId,
      category: data.category.present ? data.category.value : this.category,
      needType: data.needType.present ? data.needType.value : this.needType,
      note: data.note.present ? data.note.value : this.note,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      incomeSource:
          data.incomeSource.present
              ? data.incomeSource.value
              : this.incomeSource,
      investmentType:
          data.investmentType.present
              ? data.investmentType.value
              : this.investmentType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('transactionType: $transactionType, ')
          ..write('amount: $amount, ')
          ..write('sourceId: $sourceId, ')
          ..write('toSourceId: $toSourceId, ')
          ..write('fee: $fee, ')
          ..write('feeSourceId: $feeSourceId, ')
          ..write('category: $category, ')
          ..write('needType: $needType, ')
          ..write('note: $note, ')
          ..write('timestamp: $timestamp, ')
          ..write('incomeSource: $incomeSource, ')
          ..write('investmentType: $investmentType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    transactionType,
    amount,
    sourceId,
    toSourceId,
    fee,
    feeSourceId,
    category,
    needType,
    note,
    timestamp,
    incomeSource,
    investmentType,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.transactionType == this.transactionType &&
          other.amount == this.amount &&
          other.sourceId == this.sourceId &&
          other.toSourceId == this.toSourceId &&
          other.fee == this.fee &&
          other.feeSourceId == this.feeSourceId &&
          other.category == this.category &&
          other.needType == this.needType &&
          other.note == this.note &&
          other.timestamp == this.timestamp &&
          other.incomeSource == this.incomeSource &&
          other.investmentType == this.investmentType);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<String> id;
  final Value<String> transactionType;
  final Value<double> amount;
  final Value<String> sourceId;
  final Value<String?> toSourceId;
  final Value<double?> fee;
  final Value<String?> feeSourceId;
  final Value<String?> category;
  final Value<String?> needType;
  final Value<String?> note;
  final Value<DateTime> timestamp;
  final Value<String?> incomeSource;
  final Value<String?> investmentType;
  final Value<int> rowid;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.transactionType = const Value.absent(),
    this.amount = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.toSourceId = const Value.absent(),
    this.fee = const Value.absent(),
    this.feeSourceId = const Value.absent(),
    this.category = const Value.absent(),
    this.needType = const Value.absent(),
    this.note = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.incomeSource = const Value.absent(),
    this.investmentType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    required String transactionType,
    required double amount,
    required String sourceId,
    this.toSourceId = const Value.absent(),
    this.fee = const Value.absent(),
    this.feeSourceId = const Value.absent(),
    this.category = const Value.absent(),
    this.needType = const Value.absent(),
    this.note = const Value.absent(),
    required DateTime timestamp,
    this.incomeSource = const Value.absent(),
    this.investmentType = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : transactionType = Value(transactionType),
       amount = Value(amount),
       sourceId = Value(sourceId),
       timestamp = Value(timestamp);
  static Insertable<Transaction> custom({
    Expression<String>? id,
    Expression<String>? transactionType,
    Expression<double>? amount,
    Expression<String>? sourceId,
    Expression<String>? toSourceId,
    Expression<double>? fee,
    Expression<String>? feeSourceId,
    Expression<String>? category,
    Expression<String>? needType,
    Expression<String>? note,
    Expression<DateTime>? timestamp,
    Expression<String>? incomeSource,
    Expression<String>? investmentType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transactionType != null) 'transaction_type': transactionType,
      if (amount != null) 'amount': amount,
      if (sourceId != null) 'source_id': sourceId,
      if (toSourceId != null) 'to_source_id': toSourceId,
      if (fee != null) 'fee': fee,
      if (feeSourceId != null) 'fee_source_id': feeSourceId,
      if (category != null) 'category': category,
      if (needType != null) 'need_type': needType,
      if (note != null) 'note': note,
      if (timestamp != null) 'timestamp': timestamp,
      if (incomeSource != null) 'income_source': incomeSource,
      if (investmentType != null) 'investment_type': investmentType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionsCompanion copyWith({
    Value<String>? id,
    Value<String>? transactionType,
    Value<double>? amount,
    Value<String>? sourceId,
    Value<String?>? toSourceId,
    Value<double?>? fee,
    Value<String?>? feeSourceId,
    Value<String?>? category,
    Value<String?>? needType,
    Value<String?>? note,
    Value<DateTime>? timestamp,
    Value<String?>? incomeSource,
    Value<String?>? investmentType,
    Value<int>? rowid,
  }) {
    return TransactionsCompanion(
      id: id ?? this.id,
      transactionType: transactionType ?? this.transactionType,
      amount: amount ?? this.amount,
      sourceId: sourceId ?? this.sourceId,
      toSourceId: toSourceId ?? this.toSourceId,
      fee: fee ?? this.fee,
      feeSourceId: feeSourceId ?? this.feeSourceId,
      category: category ?? this.category,
      needType: needType ?? this.needType,
      note: note ?? this.note,
      timestamp: timestamp ?? this.timestamp,
      incomeSource: incomeSource ?? this.incomeSource,
      investmentType: investmentType ?? this.investmentType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (transactionType.present) {
      map['transaction_type'] = Variable<String>(transactionType.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (toSourceId.present) {
      map['to_source_id'] = Variable<String>(toSourceId.value);
    }
    if (fee.present) {
      map['fee'] = Variable<double>(fee.value);
    }
    if (feeSourceId.present) {
      map['fee_source_id'] = Variable<String>(feeSourceId.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (needType.present) {
      map['need_type'] = Variable<String>(needType.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (incomeSource.present) {
      map['income_source'] = Variable<String>(incomeSource.value);
    }
    if (investmentType.present) {
      map['investment_type'] = Variable<String>(investmentType.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('transactionType: $transactionType, ')
          ..write('amount: $amount, ')
          ..write('sourceId: $sourceId, ')
          ..write('toSourceId: $toSourceId, ')
          ..write('fee: $fee, ')
          ..write('feeSourceId: $feeSourceId, ')
          ..write('category: $category, ')
          ..write('needType: $needType, ')
          ..write('note: $note, ')
          ..write('timestamp: $timestamp, ')
          ..write('incomeSource: $incomeSource, ')
          ..write('investmentType: $investmentType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SourcesTable extends Sources with TableInfo<$SourcesTable, Source> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SourcesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    check: () => type.isIn(SourceType.values.map((e) => e.name).toList()),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isVirtualMeta = const VerificationMeta(
    'isVirtual',
  );
  @override
  late final GeneratedColumn<bool> isVirtual = GeneratedColumn<bool>(
    'is_virtual',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_virtual" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, type, isVirtual];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sources';
  @override
  VerificationContext validateIntegrity(
    Insertable<Source> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('is_virtual')) {
      context.handle(
        _isVirtualMeta,
        isVirtual.isAcceptableOrUnknown(data['is_virtual']!, _isVirtualMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Source map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Source(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      type:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}type'],
          )!,
      isVirtual:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_virtual'],
          )!,
    );
  }

  @override
  $SourcesTable createAlias(String alias) {
    return $SourcesTable(attachedDatabase, alias);
  }
}

class Source extends DataClass implements Insertable<Source> {
  final String id;
  final String name;
  final String type;
  final bool isVirtual;
  const Source({
    required this.id,
    required this.name,
    required this.type,
    required this.isVirtual,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['is_virtual'] = Variable<bool>(isVirtual);
    return map;
  }

  SourcesCompanion toCompanion(bool nullToAbsent) {
    return SourcesCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      isVirtual: Value(isVirtual),
    );
  }

  factory Source.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Source(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      isVirtual: serializer.fromJson<bool>(json['isVirtual']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'isVirtual': serializer.toJson<bool>(isVirtual),
    };
  }

  Source copyWith({String? id, String? name, String? type, bool? isVirtual}) =>
      Source(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        isVirtual: isVirtual ?? this.isVirtual,
      );
  Source copyWithCompanion(SourcesCompanion data) {
    return Source(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      isVirtual: data.isVirtual.present ? data.isVirtual.value : this.isVirtual,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Source(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('isVirtual: $isVirtual')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, type, isVirtual);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Source &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.isVirtual == this.isVirtual);
}

class SourcesCompanion extends UpdateCompanion<Source> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> type;
  final Value<bool> isVirtual;
  final Value<int> rowid;
  const SourcesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.isVirtual = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SourcesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String type,
    this.isVirtual = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       type = Value(type);
  static Insertable<Source> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<bool>? isVirtual,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (isVirtual != null) 'is_virtual': isVirtual,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SourcesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? type,
    Value<bool>? isVirtual,
    Value<int>? rowid,
  }) {
    return SourcesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      isVirtual: isVirtual ?? this.isVirtual,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (isVirtual.present) {
      map['is_virtual'] = Variable<bool>(isVirtual.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SourcesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('isVirtual: $isVirtual, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PersonsTable extends Persons with TableInfo<$PersonsTable, Person> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, phone];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'persons';
  @override
  VerificationContext validateIntegrity(
    Insertable<Person> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Person map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Person(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
    );
  }

  @override
  $PersonsTable createAlias(String alias) {
    return $PersonsTable(attachedDatabase, alias);
  }
}

class Person extends DataClass implements Insertable<Person> {
  final String id;
  final String name;
  final String? phone;
  const Person({required this.id, required this.name, this.phone});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    return map;
  }

  PersonsCompanion toCompanion(bool nullToAbsent) {
    return PersonsCompanion(
      id: Value(id),
      name: Value(name),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
    );
  }

  factory Person.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Person(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
    };
  }

  Person copyWith({
    String? id,
    String? name,
    Value<String?> phone = const Value.absent(),
  }) => Person(
    id: id ?? this.id,
    name: name ?? this.name,
    phone: phone.present ? phone.value : this.phone,
  );
  Person copyWithCompanion(PersonsCompanion data) {
    return Person(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Person(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, phone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Person &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone);
}

class PersonsCompanion extends UpdateCompanion<Person> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> phone;
  final Value<int> rowid;
  const PersonsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PersonsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.phone = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Person> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PersonsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? phone,
    Value<int>? rowid,
  }) {
    return PersonsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SplitItemsTable splitItems = $SplitItemsTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $SourcesTable sources = $SourcesTable(this);
  late final $PersonsTable persons = $PersonsTable(this);
  late final TransactionDao transactionDao = TransactionDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    splitItems,
    transactions,
    sources,
    persons,
  ];
}

typedef $$SplitItemsTableCreateCompanionBuilder =
    SplitItemsCompanion Function({
      Value<String> id,
      required String transactionId,
      required double amount,
      required String paidFor,
      Value<String?> personId,
      Value<bool> isSplitwise,
      Value<String?> category,
      Value<int> rowid,
    });
typedef $$SplitItemsTableUpdateCompanionBuilder =
    SplitItemsCompanion Function({
      Value<String> id,
      Value<String> transactionId,
      Value<double> amount,
      Value<String> paidFor,
      Value<String?> personId,
      Value<bool> isSplitwise,
      Value<String?> category,
      Value<int> rowid,
    });

class $$SplitItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SplitItemsTable> {
  $$SplitItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get transactionId => $composableBuilder(
    column: $table.transactionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paidFor => $composableBuilder(
    column: $table.paidFor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSplitwise => $composableBuilder(
    column: $table.isSplitwise,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SplitItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SplitItemsTable> {
  $$SplitItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get transactionId => $composableBuilder(
    column: $table.transactionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paidFor => $composableBuilder(
    column: $table.paidFor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSplitwise => $composableBuilder(
    column: $table.isSplitwise,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SplitItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SplitItemsTable> {
  $$SplitItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get transactionId => $composableBuilder(
    column: $table.transactionId,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get paidFor =>
      $composableBuilder(column: $table.paidFor, builder: (column) => column);

  GeneratedColumn<String> get personId =>
      $composableBuilder(column: $table.personId, builder: (column) => column);

  GeneratedColumn<bool> get isSplitwise => $composableBuilder(
    column: $table.isSplitwise,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);
}

class $$SplitItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SplitItemsTable,
          SplitItem,
          $$SplitItemsTableFilterComposer,
          $$SplitItemsTableOrderingComposer,
          $$SplitItemsTableAnnotationComposer,
          $$SplitItemsTableCreateCompanionBuilder,
          $$SplitItemsTableUpdateCompanionBuilder,
          (
            SplitItem,
            BaseReferences<_$AppDatabase, $SplitItemsTable, SplitItem>,
          ),
          SplitItem,
          PrefetchHooks Function()
        > {
  $$SplitItemsTableTableManager(_$AppDatabase db, $SplitItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SplitItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SplitItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$SplitItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> transactionId = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> paidFor = const Value.absent(),
                Value<String?> personId = const Value.absent(),
                Value<bool> isSplitwise = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SplitItemsCompanion(
                id: id,
                transactionId: transactionId,
                amount: amount,
                paidFor: paidFor,
                personId: personId,
                isSplitwise: isSplitwise,
                category: category,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String transactionId,
                required double amount,
                required String paidFor,
                Value<String?> personId = const Value.absent(),
                Value<bool> isSplitwise = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SplitItemsCompanion.insert(
                id: id,
                transactionId: transactionId,
                amount: amount,
                paidFor: paidFor,
                personId: personId,
                isSplitwise: isSplitwise,
                category: category,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SplitItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SplitItemsTable,
      SplitItem,
      $$SplitItemsTableFilterComposer,
      $$SplitItemsTableOrderingComposer,
      $$SplitItemsTableAnnotationComposer,
      $$SplitItemsTableCreateCompanionBuilder,
      $$SplitItemsTableUpdateCompanionBuilder,
      (SplitItem, BaseReferences<_$AppDatabase, $SplitItemsTable, SplitItem>),
      SplitItem,
      PrefetchHooks Function()
    >;
typedef $$TransactionsTableCreateCompanionBuilder =
    TransactionsCompanion Function({
      Value<String> id,
      required String transactionType,
      required double amount,
      required String sourceId,
      Value<String?> toSourceId,
      Value<double?> fee,
      Value<String?> feeSourceId,
      Value<String?> category,
      Value<String?> needType,
      Value<String?> note,
      required DateTime timestamp,
      Value<String?> incomeSource,
      Value<String?> investmentType,
      Value<int> rowid,
    });
typedef $$TransactionsTableUpdateCompanionBuilder =
    TransactionsCompanion Function({
      Value<String> id,
      Value<String> transactionType,
      Value<double> amount,
      Value<String> sourceId,
      Value<String?> toSourceId,
      Value<double?> fee,
      Value<String?> feeSourceId,
      Value<String?> category,
      Value<String?> needType,
      Value<String?> note,
      Value<DateTime> timestamp,
      Value<String?> incomeSource,
      Value<String?> investmentType,
      Value<int> rowid,
    });

class $$TransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get transactionType => $composableBuilder(
    column: $table.transactionType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get toSourceId => $composableBuilder(
    column: $table.toSourceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fee => $composableBuilder(
    column: $table.fee,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get feeSourceId => $composableBuilder(
    column: $table.feeSourceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get needType => $composableBuilder(
    column: $table.needType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get incomeSource => $composableBuilder(
    column: $table.incomeSource,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get investmentType => $composableBuilder(
    column: $table.investmentType,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get transactionType => $composableBuilder(
    column: $table.transactionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get toSourceId => $composableBuilder(
    column: $table.toSourceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fee => $composableBuilder(
    column: $table.fee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get feeSourceId => $composableBuilder(
    column: $table.feeSourceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get needType => $composableBuilder(
    column: $table.needType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get incomeSource => $composableBuilder(
    column: $table.incomeSource,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get investmentType => $composableBuilder(
    column: $table.investmentType,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get transactionType => $composableBuilder(
    column: $table.transactionType,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<String> get toSourceId => $composableBuilder(
    column: $table.toSourceId,
    builder: (column) => column,
  );

  GeneratedColumn<double> get fee =>
      $composableBuilder(column: $table.fee, builder: (column) => column);

  GeneratedColumn<String> get feeSourceId => $composableBuilder(
    column: $table.feeSourceId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get needType =>
      $composableBuilder(column: $table.needType, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get incomeSource => $composableBuilder(
    column: $table.incomeSource,
    builder: (column) => column,
  );

  GeneratedColumn<String> get investmentType => $composableBuilder(
    column: $table.investmentType,
    builder: (column) => column,
  );
}

class $$TransactionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionsTable,
          Transaction,
          $$TransactionsTableFilterComposer,
          $$TransactionsTableOrderingComposer,
          $$TransactionsTableAnnotationComposer,
          $$TransactionsTableCreateCompanionBuilder,
          $$TransactionsTableUpdateCompanionBuilder,
          (
            Transaction,
            BaseReferences<_$AppDatabase, $TransactionsTable, Transaction>,
          ),
          Transaction,
          PrefetchHooks Function()
        > {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> transactionType = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> sourceId = const Value.absent(),
                Value<String?> toSourceId = const Value.absent(),
                Value<double?> fee = const Value.absent(),
                Value<String?> feeSourceId = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> needType = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<String?> incomeSource = const Value.absent(),
                Value<String?> investmentType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionsCompanion(
                id: id,
                transactionType: transactionType,
                amount: amount,
                sourceId: sourceId,
                toSourceId: toSourceId,
                fee: fee,
                feeSourceId: feeSourceId,
                category: category,
                needType: needType,
                note: note,
                timestamp: timestamp,
                incomeSource: incomeSource,
                investmentType: investmentType,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String transactionType,
                required double amount,
                required String sourceId,
                Value<String?> toSourceId = const Value.absent(),
                Value<double?> fee = const Value.absent(),
                Value<String?> feeSourceId = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> needType = const Value.absent(),
                Value<String?> note = const Value.absent(),
                required DateTime timestamp,
                Value<String?> incomeSource = const Value.absent(),
                Value<String?> investmentType = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionsCompanion.insert(
                id: id,
                transactionType: transactionType,
                amount: amount,
                sourceId: sourceId,
                toSourceId: toSourceId,
                fee: fee,
                feeSourceId: feeSourceId,
                category: category,
                needType: needType,
                note: note,
                timestamp: timestamp,
                incomeSource: incomeSource,
                investmentType: investmentType,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TransactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionsTable,
      Transaction,
      $$TransactionsTableFilterComposer,
      $$TransactionsTableOrderingComposer,
      $$TransactionsTableAnnotationComposer,
      $$TransactionsTableCreateCompanionBuilder,
      $$TransactionsTableUpdateCompanionBuilder,
      (
        Transaction,
        BaseReferences<_$AppDatabase, $TransactionsTable, Transaction>,
      ),
      Transaction,
      PrefetchHooks Function()
    >;
typedef $$SourcesTableCreateCompanionBuilder =
    SourcesCompanion Function({
      Value<String> id,
      required String name,
      required String type,
      Value<bool> isVirtual,
      Value<int> rowid,
    });
typedef $$SourcesTableUpdateCompanionBuilder =
    SourcesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> type,
      Value<bool> isVirtual,
      Value<int> rowid,
    });

class $$SourcesTableFilterComposer
    extends Composer<_$AppDatabase, $SourcesTable> {
  $$SourcesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isVirtual => $composableBuilder(
    column: $table.isVirtual,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SourcesTableOrderingComposer
    extends Composer<_$AppDatabase, $SourcesTable> {
  $$SourcesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isVirtual => $composableBuilder(
    column: $table.isVirtual,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SourcesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SourcesTable> {
  $$SourcesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get isVirtual =>
      $composableBuilder(column: $table.isVirtual, builder: (column) => column);
}

class $$SourcesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SourcesTable,
          Source,
          $$SourcesTableFilterComposer,
          $$SourcesTableOrderingComposer,
          $$SourcesTableAnnotationComposer,
          $$SourcesTableCreateCompanionBuilder,
          $$SourcesTableUpdateCompanionBuilder,
          (Source, BaseReferences<_$AppDatabase, $SourcesTable, Source>),
          Source,
          PrefetchHooks Function()
        > {
  $$SourcesTableTableManager(_$AppDatabase db, $SourcesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SourcesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SourcesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$SourcesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<bool> isVirtual = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SourcesCompanion(
                id: id,
                name: name,
                type: type,
                isVirtual: isVirtual,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String name,
                required String type,
                Value<bool> isVirtual = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SourcesCompanion.insert(
                id: id,
                name: name,
                type: type,
                isVirtual: isVirtual,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SourcesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SourcesTable,
      Source,
      $$SourcesTableFilterComposer,
      $$SourcesTableOrderingComposer,
      $$SourcesTableAnnotationComposer,
      $$SourcesTableCreateCompanionBuilder,
      $$SourcesTableUpdateCompanionBuilder,
      (Source, BaseReferences<_$AppDatabase, $SourcesTable, Source>),
      Source,
      PrefetchHooks Function()
    >;
typedef $$PersonsTableCreateCompanionBuilder =
    PersonsCompanion Function({
      Value<String> id,
      required String name,
      Value<String?> phone,
      Value<int> rowid,
    });
typedef $$PersonsTableUpdateCompanionBuilder =
    PersonsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> phone,
      Value<int> rowid,
    });

class $$PersonsTableFilterComposer
    extends Composer<_$AppDatabase, $PersonsTable> {
  $$PersonsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PersonsTableOrderingComposer
    extends Composer<_$AppDatabase, $PersonsTable> {
  $$PersonsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PersonsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PersonsTable> {
  $$PersonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);
}

class $$PersonsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PersonsTable,
          Person,
          $$PersonsTableFilterComposer,
          $$PersonsTableOrderingComposer,
          $$PersonsTableAnnotationComposer,
          $$PersonsTableCreateCompanionBuilder,
          $$PersonsTableUpdateCompanionBuilder,
          (Person, BaseReferences<_$AppDatabase, $PersonsTable, Person>),
          Person,
          PrefetchHooks Function()
        > {
  $$PersonsTableTableManager(_$AppDatabase db, $PersonsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PersonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$PersonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$PersonsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PersonsCompanion(
                id: id,
                name: name,
                phone: phone,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String name,
                Value<String?> phone = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PersonsCompanion.insert(
                id: id,
                name: name,
                phone: phone,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PersonsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PersonsTable,
      Person,
      $$PersonsTableFilterComposer,
      $$PersonsTableOrderingComposer,
      $$PersonsTableAnnotationComposer,
      $$PersonsTableCreateCompanionBuilder,
      $$PersonsTableUpdateCompanionBuilder,
      (Person, BaseReferences<_$AppDatabase, $PersonsTable, Person>),
      Person,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SplitItemsTableTableManager get splitItems =>
      $$SplitItemsTableTableManager(_db, _db.splitItems);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$SourcesTableTableManager get sources =>
      $$SourcesTableTableManager(_db, _db.sources);
  $$PersonsTableTableManager get persons =>
      $$PersonsTableTableManager(_db, _db.persons);
}
