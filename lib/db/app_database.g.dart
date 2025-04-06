// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
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
          ..write('note: $note, ')
          ..write('timestamp: $timestamp, ')
          ..write('incomeSource: $incomeSource, ')
          ..write('investmentType: $investmentType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [transactions];
}

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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
}
