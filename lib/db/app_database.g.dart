// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TransactionTypesTable extends TransactionTypes
    with TableInfo<$TransactionTypesTable, TransactionType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_types';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionType> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionType(
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
    );
  }

  @override
  $TransactionTypesTable createAlias(String alias) {
    return $TransactionTypesTable(attachedDatabase, alias);
  }
}

class TransactionType extends DataClass implements Insertable<TransactionType> {
  final String id;
  final String name;
  const TransactionType({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  TransactionTypesCompanion toCompanion(bool nullToAbsent) {
    return TransactionTypesCompanion(id: Value(id), name: Value(name));
  }

  factory TransactionType.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionType(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  TransactionType copyWith({String? id, String? name}) =>
      TransactionType(id: id ?? this.id, name: name ?? this.name);
  TransactionType copyWithCompanion(TransactionTypesCompanion data) {
    return TransactionType(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionType(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionType &&
          other.id == this.id &&
          other.name == this.name);
}

class TransactionTypesCompanion extends UpdateCompanion<TransactionType> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> rowid;
  const TransactionTypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionTypesCompanion.insert({
    required String id,
    required String name,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<TransactionType> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionTypesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? rowid,
  }) {
    return TransactionTypesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionTypesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SourceTypesTable extends SourceTypes
    with TableInfo<$SourceTypesTable, SourceType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SourceTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'source_types';
  @override
  VerificationContext validateIntegrity(
    Insertable<SourceType> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SourceType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SourceType(
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
    );
  }

  @override
  $SourceTypesTable createAlias(String alias) {
    return $SourceTypesTable(attachedDatabase, alias);
  }
}

class SourceType extends DataClass implements Insertable<SourceType> {
  final String id;
  final String name;
  const SourceType({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  SourceTypesCompanion toCompanion(bool nullToAbsent) {
    return SourceTypesCompanion(id: Value(id), name: Value(name));
  }

  factory SourceType.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SourceType(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  SourceType copyWith({String? id, String? name}) =>
      SourceType(id: id ?? this.id, name: name ?? this.name);
  SourceType copyWithCompanion(SourceTypesCompanion data) {
    return SourceType(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SourceType(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SourceType && other.id == this.id && other.name == this.name);
}

class SourceTypesCompanion extends UpdateCompanion<SourceType> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> rowid;
  const SourceTypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SourceTypesCompanion.insert({
    required String id,
    required String name,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<SourceType> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SourceTypesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? rowid,
  }) {
    return SourceTypesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SourceTypesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SourceCategoriesTable extends SourceCategories
    with TableInfo<$SourceCategoriesTable, SourceCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SourceCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'source_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<SourceCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SourceCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SourceCategory(
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
    );
  }

  @override
  $SourceCategoriesTable createAlias(String alias) {
    return $SourceCategoriesTable(attachedDatabase, alias);
  }
}

class SourceCategory extends DataClass implements Insertable<SourceCategory> {
  final String id;
  final String name;
  const SourceCategory({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  SourceCategoriesCompanion toCompanion(bool nullToAbsent) {
    return SourceCategoriesCompanion(id: Value(id), name: Value(name));
  }

  factory SourceCategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SourceCategory(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  SourceCategory copyWith({String? id, String? name}) =>
      SourceCategory(id: id ?? this.id, name: name ?? this.name);
  SourceCategory copyWithCompanion(SourceCategoriesCompanion data) {
    return SourceCategory(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SourceCategory(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SourceCategory &&
          other.id == this.id &&
          other.name == this.name);
}

class SourceCategoriesCompanion extends UpdateCompanion<SourceCategory> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> rowid;
  const SourceCategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SourceCategoriesCompanion.insert({
    required String id,
    required String name,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<SourceCategory> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SourceCategoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? rowid,
  }) {
    return SourceCategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SourceCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
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
    requiredDuringInsert: true,
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
  static const VerificationMeta _sourceTypeIdMeta = const VerificationMeta(
    'sourceTypeId',
  );
  @override
  late final GeneratedColumn<String> sourceTypeId = GeneratedColumn<String>(
    'source_type_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES source_types (id)',
    ),
  );
  static const VerificationMeta _sourceCategoryIdMeta = const VerificationMeta(
    'sourceCategoryId',
  );
  @override
  late final GeneratedColumn<String> sourceCategoryId = GeneratedColumn<String>(
    'source_category_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES source_categories (id)',
    ),
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
  List<GeneratedColumn> get $columns => [
    id,
    name,
    sourceTypeId,
    sourceCategoryId,
    isVirtual,
  ];
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
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('source_type_id')) {
      context.handle(
        _sourceTypeIdMeta,
        sourceTypeId.isAcceptableOrUnknown(
          data['source_type_id']!,
          _sourceTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sourceTypeIdMeta);
    }
    if (data.containsKey('source_category_id')) {
      context.handle(
        _sourceCategoryIdMeta,
        sourceCategoryId.isAcceptableOrUnknown(
          data['source_category_id']!,
          _sourceCategoryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sourceCategoryIdMeta);
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
      sourceTypeId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}source_type_id'],
          )!,
      sourceCategoryId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}source_category_id'],
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
  final String sourceTypeId;
  final String sourceCategoryId;
  final bool isVirtual;
  const Source({
    required this.id,
    required this.name,
    required this.sourceTypeId,
    required this.sourceCategoryId,
    required this.isVirtual,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['source_type_id'] = Variable<String>(sourceTypeId);
    map['source_category_id'] = Variable<String>(sourceCategoryId);
    map['is_virtual'] = Variable<bool>(isVirtual);
    return map;
  }

  SourcesCompanion toCompanion(bool nullToAbsent) {
    return SourcesCompanion(
      id: Value(id),
      name: Value(name),
      sourceTypeId: Value(sourceTypeId),
      sourceCategoryId: Value(sourceCategoryId),
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
      sourceTypeId: serializer.fromJson<String>(json['sourceTypeId']),
      sourceCategoryId: serializer.fromJson<String>(json['sourceCategoryId']),
      isVirtual: serializer.fromJson<bool>(json['isVirtual']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'sourceTypeId': serializer.toJson<String>(sourceTypeId),
      'sourceCategoryId': serializer.toJson<String>(sourceCategoryId),
      'isVirtual': serializer.toJson<bool>(isVirtual),
    };
  }

  Source copyWith({
    String? id,
    String? name,
    String? sourceTypeId,
    String? sourceCategoryId,
    bool? isVirtual,
  }) => Source(
    id: id ?? this.id,
    name: name ?? this.name,
    sourceTypeId: sourceTypeId ?? this.sourceTypeId,
    sourceCategoryId: sourceCategoryId ?? this.sourceCategoryId,
    isVirtual: isVirtual ?? this.isVirtual,
  );
  Source copyWithCompanion(SourcesCompanion data) {
    return Source(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      sourceTypeId:
          data.sourceTypeId.present
              ? data.sourceTypeId.value
              : this.sourceTypeId,
      sourceCategoryId:
          data.sourceCategoryId.present
              ? data.sourceCategoryId.value
              : this.sourceCategoryId,
      isVirtual: data.isVirtual.present ? data.isVirtual.value : this.isVirtual,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Source(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sourceTypeId: $sourceTypeId, ')
          ..write('sourceCategoryId: $sourceCategoryId, ')
          ..write('isVirtual: $isVirtual')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, sourceTypeId, sourceCategoryId, isVirtual);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Source &&
          other.id == this.id &&
          other.name == this.name &&
          other.sourceTypeId == this.sourceTypeId &&
          other.sourceCategoryId == this.sourceCategoryId &&
          other.isVirtual == this.isVirtual);
}

class SourcesCompanion extends UpdateCompanion<Source> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> sourceTypeId;
  final Value<String> sourceCategoryId;
  final Value<bool> isVirtual;
  final Value<int> rowid;
  const SourcesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sourceTypeId = const Value.absent(),
    this.sourceCategoryId = const Value.absent(),
    this.isVirtual = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SourcesCompanion.insert({
    required String id,
    required String name,
    required String sourceTypeId,
    required String sourceCategoryId,
    this.isVirtual = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       sourceTypeId = Value(sourceTypeId),
       sourceCategoryId = Value(sourceCategoryId);
  static Insertable<Source> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? sourceTypeId,
    Expression<String>? sourceCategoryId,
    Expression<bool>? isVirtual,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sourceTypeId != null) 'source_type_id': sourceTypeId,
      if (sourceCategoryId != null) 'source_category_id': sourceCategoryId,
      if (isVirtual != null) 'is_virtual': isVirtual,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SourcesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? sourceTypeId,
    Value<String>? sourceCategoryId,
    Value<bool>? isVirtual,
    Value<int>? rowid,
  }) {
    return SourcesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sourceTypeId: sourceTypeId ?? this.sourceTypeId,
      sourceCategoryId: sourceCategoryId ?? this.sourceCategoryId,
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
    if (sourceTypeId.present) {
      map['source_type_id'] = Variable<String>(sourceTypeId.value);
    }
    if (sourceCategoryId.present) {
      map['source_category_id'] = Variable<String>(sourceCategoryId.value);
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
          ..write('sourceTypeId: $sourceTypeId, ')
          ..write('sourceCategoryId: $sourceCategoryId, ')
          ..write('isVirtual: $isVirtual, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionCategoriesTable extends TransactionCategories
    with TableInfo<$TransactionCategoriesTable, TransactionCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionCategory(
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
    );
  }

  @override
  $TransactionCategoriesTable createAlias(String alias) {
    return $TransactionCategoriesTable(attachedDatabase, alias);
  }
}

class TransactionCategory extends DataClass
    implements Insertable<TransactionCategory> {
  final String id;
  final String name;
  const TransactionCategory({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  TransactionCategoriesCompanion toCompanion(bool nullToAbsent) {
    return TransactionCategoriesCompanion(id: Value(id), name: Value(name));
  }

  factory TransactionCategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionCategory(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  TransactionCategory copyWith({String? id, String? name}) =>
      TransactionCategory(id: id ?? this.id, name: name ?? this.name);
  TransactionCategory copyWithCompanion(TransactionCategoriesCompanion data) {
    return TransactionCategory(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionCategory(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionCategory &&
          other.id == this.id &&
          other.name == this.name);
}

class TransactionCategoriesCompanion
    extends UpdateCompanion<TransactionCategory> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> rowid;
  const TransactionCategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionCategoriesCompanion.insert({
    required String id,
    required String name,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<TransactionCategory> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionCategoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? rowid,
  }) {
    return TransactionCategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InvestmentTypesTable extends InvestmentTypes
    with TableInfo<$InvestmentTypesTable, InvestmentType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvestmentTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'investment_types';
  @override
  VerificationContext validateIntegrity(
    Insertable<InvestmentType> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InvestmentType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InvestmentType(
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
    );
  }

  @override
  $InvestmentTypesTable createAlias(String alias) {
    return $InvestmentTypesTable(attachedDatabase, alias);
  }
}

class InvestmentType extends DataClass implements Insertable<InvestmentType> {
  final String id;
  final String name;
  const InvestmentType({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  InvestmentTypesCompanion toCompanion(bool nullToAbsent) {
    return InvestmentTypesCompanion(id: Value(id), name: Value(name));
  }

  factory InvestmentType.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InvestmentType(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  InvestmentType copyWith({String? id, String? name}) =>
      InvestmentType(id: id ?? this.id, name: name ?? this.name);
  InvestmentType copyWithCompanion(InvestmentTypesCompanion data) {
    return InvestmentType(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InvestmentType(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InvestmentType &&
          other.id == this.id &&
          other.name == this.name);
}

class InvestmentTypesCompanion extends UpdateCompanion<InvestmentType> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> rowid;
  const InvestmentTypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InvestmentTypesCompanion.insert({
    required String id,
    required String name,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<InvestmentType> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InvestmentTypesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? rowid,
  }) {
    return InvestmentTypesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvestmentTypesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
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
    requiredDuringInsert: true,
  );
  static const VerificationMeta _transactionTypeIdMeta = const VerificationMeta(
    'transactionTypeId',
  );
  @override
  late final GeneratedColumn<String> transactionTypeId =
      GeneratedColumn<String>(
        'transaction_type_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES transaction_types (id)',
        ),
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sources (id)',
    ),
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sources (id)',
    ),
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sources (id)',
    ),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES transaction_categories (id)',
    ),
  );
  static const VerificationMeta _needTypeMeta = const VerificationMeta(
    'needType',
  );
  @override
  late final GeneratedColumn<String> needType = GeneratedColumn<String>(
    'need_type',
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
  static const VerificationMeta _incomeSourceIdMeta = const VerificationMeta(
    'incomeSourceId',
  );
  @override
  late final GeneratedColumn<String> incomeSourceId = GeneratedColumn<String>(
    'income_source_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sources (id)',
    ),
  );
  static const VerificationMeta _investmentTypeIdMeta = const VerificationMeta(
    'investmentTypeId',
  );
  @override
  late final GeneratedColumn<String> investmentTypeId = GeneratedColumn<String>(
    'investment_type_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES investment_types (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    transactionTypeId,
    amount,
    sourceId,
    toSourceId,
    fee,
    feeSourceId,
    categoryId,
    needType,
    note,
    timestamp,
    incomeSourceId,
    investmentTypeId,
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
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('transaction_type_id')) {
      context.handle(
        _transactionTypeIdMeta,
        transactionTypeId.isAcceptableOrUnknown(
          data['transaction_type_id']!,
          _transactionTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionTypeIdMeta);
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
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
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
    if (data.containsKey('income_source_id')) {
      context.handle(
        _incomeSourceIdMeta,
        incomeSourceId.isAcceptableOrUnknown(
          data['income_source_id']!,
          _incomeSourceIdMeta,
        ),
      );
    }
    if (data.containsKey('investment_type_id')) {
      context.handle(
        _investmentTypeIdMeta,
        investmentTypeId.isAcceptableOrUnknown(
          data['investment_type_id']!,
          _investmentTypeIdMeta,
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
      transactionTypeId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}transaction_type_id'],
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
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
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
      incomeSourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}income_source_id'],
      ),
      investmentTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}investment_type_id'],
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
  final String transactionTypeId;
  final double amount;
  final String sourceId;
  final String? toSourceId;
  final double? fee;
  final String? feeSourceId;
  final String? categoryId;
  final String? needType;
  final String? note;
  final DateTime timestamp;
  final String? incomeSourceId;
  final String? investmentTypeId;
  const Transaction({
    required this.id,
    required this.transactionTypeId,
    required this.amount,
    required this.sourceId,
    this.toSourceId,
    this.fee,
    this.feeSourceId,
    this.categoryId,
    this.needType,
    this.note,
    required this.timestamp,
    this.incomeSourceId,
    this.investmentTypeId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['transaction_type_id'] = Variable<String>(transactionTypeId);
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
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    if (!nullToAbsent || needType != null) {
      map['need_type'] = Variable<String>(needType);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    if (!nullToAbsent || incomeSourceId != null) {
      map['income_source_id'] = Variable<String>(incomeSourceId);
    }
    if (!nullToAbsent || investmentTypeId != null) {
      map['investment_type_id'] = Variable<String>(investmentTypeId);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      transactionTypeId: Value(transactionTypeId),
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
      categoryId:
          categoryId == null && nullToAbsent
              ? const Value.absent()
              : Value(categoryId),
      needType:
          needType == null && nullToAbsent
              ? const Value.absent()
              : Value(needType),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      timestamp: Value(timestamp),
      incomeSourceId:
          incomeSourceId == null && nullToAbsent
              ? const Value.absent()
              : Value(incomeSourceId),
      investmentTypeId:
          investmentTypeId == null && nullToAbsent
              ? const Value.absent()
              : Value(investmentTypeId),
    );
  }

  factory Transaction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<String>(json['id']),
      transactionTypeId: serializer.fromJson<String>(json['transactionTypeId']),
      amount: serializer.fromJson<double>(json['amount']),
      sourceId: serializer.fromJson<String>(json['sourceId']),
      toSourceId: serializer.fromJson<String?>(json['toSourceId']),
      fee: serializer.fromJson<double?>(json['fee']),
      feeSourceId: serializer.fromJson<String?>(json['feeSourceId']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      needType: serializer.fromJson<String?>(json['needType']),
      note: serializer.fromJson<String?>(json['note']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      incomeSourceId: serializer.fromJson<String?>(json['incomeSourceId']),
      investmentTypeId: serializer.fromJson<String?>(json['investmentTypeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'transactionTypeId': serializer.toJson<String>(transactionTypeId),
      'amount': serializer.toJson<double>(amount),
      'sourceId': serializer.toJson<String>(sourceId),
      'toSourceId': serializer.toJson<String?>(toSourceId),
      'fee': serializer.toJson<double?>(fee),
      'feeSourceId': serializer.toJson<String?>(feeSourceId),
      'categoryId': serializer.toJson<String?>(categoryId),
      'needType': serializer.toJson<String?>(needType),
      'note': serializer.toJson<String?>(note),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'incomeSourceId': serializer.toJson<String?>(incomeSourceId),
      'investmentTypeId': serializer.toJson<String?>(investmentTypeId),
    };
  }

  Transaction copyWith({
    String? id,
    String? transactionTypeId,
    double? amount,
    String? sourceId,
    Value<String?> toSourceId = const Value.absent(),
    Value<double?> fee = const Value.absent(),
    Value<String?> feeSourceId = const Value.absent(),
    Value<String?> categoryId = const Value.absent(),
    Value<String?> needType = const Value.absent(),
    Value<String?> note = const Value.absent(),
    DateTime? timestamp,
    Value<String?> incomeSourceId = const Value.absent(),
    Value<String?> investmentTypeId = const Value.absent(),
  }) => Transaction(
    id: id ?? this.id,
    transactionTypeId: transactionTypeId ?? this.transactionTypeId,
    amount: amount ?? this.amount,
    sourceId: sourceId ?? this.sourceId,
    toSourceId: toSourceId.present ? toSourceId.value : this.toSourceId,
    fee: fee.present ? fee.value : this.fee,
    feeSourceId: feeSourceId.present ? feeSourceId.value : this.feeSourceId,
    categoryId: categoryId.present ? categoryId.value : this.categoryId,
    needType: needType.present ? needType.value : this.needType,
    note: note.present ? note.value : this.note,
    timestamp: timestamp ?? this.timestamp,
    incomeSourceId:
        incomeSourceId.present ? incomeSourceId.value : this.incomeSourceId,
    investmentTypeId:
        investmentTypeId.present
            ? investmentTypeId.value
            : this.investmentTypeId,
  );
  Transaction copyWithCompanion(TransactionsCompanion data) {
    return Transaction(
      id: data.id.present ? data.id.value : this.id,
      transactionTypeId:
          data.transactionTypeId.present
              ? data.transactionTypeId.value
              : this.transactionTypeId,
      amount: data.amount.present ? data.amount.value : this.amount,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      toSourceId:
          data.toSourceId.present ? data.toSourceId.value : this.toSourceId,
      fee: data.fee.present ? data.fee.value : this.fee,
      feeSourceId:
          data.feeSourceId.present ? data.feeSourceId.value : this.feeSourceId,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      needType: data.needType.present ? data.needType.value : this.needType,
      note: data.note.present ? data.note.value : this.note,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      incomeSourceId:
          data.incomeSourceId.present
              ? data.incomeSourceId.value
              : this.incomeSourceId,
      investmentTypeId:
          data.investmentTypeId.present
              ? data.investmentTypeId.value
              : this.investmentTypeId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('transactionTypeId: $transactionTypeId, ')
          ..write('amount: $amount, ')
          ..write('sourceId: $sourceId, ')
          ..write('toSourceId: $toSourceId, ')
          ..write('fee: $fee, ')
          ..write('feeSourceId: $feeSourceId, ')
          ..write('categoryId: $categoryId, ')
          ..write('needType: $needType, ')
          ..write('note: $note, ')
          ..write('timestamp: $timestamp, ')
          ..write('incomeSourceId: $incomeSourceId, ')
          ..write('investmentTypeId: $investmentTypeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    transactionTypeId,
    amount,
    sourceId,
    toSourceId,
    fee,
    feeSourceId,
    categoryId,
    needType,
    note,
    timestamp,
    incomeSourceId,
    investmentTypeId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.transactionTypeId == this.transactionTypeId &&
          other.amount == this.amount &&
          other.sourceId == this.sourceId &&
          other.toSourceId == this.toSourceId &&
          other.fee == this.fee &&
          other.feeSourceId == this.feeSourceId &&
          other.categoryId == this.categoryId &&
          other.needType == this.needType &&
          other.note == this.note &&
          other.timestamp == this.timestamp &&
          other.incomeSourceId == this.incomeSourceId &&
          other.investmentTypeId == this.investmentTypeId);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<String> id;
  final Value<String> transactionTypeId;
  final Value<double> amount;
  final Value<String> sourceId;
  final Value<String?> toSourceId;
  final Value<double?> fee;
  final Value<String?> feeSourceId;
  final Value<String?> categoryId;
  final Value<String?> needType;
  final Value<String?> note;
  final Value<DateTime> timestamp;
  final Value<String?> incomeSourceId;
  final Value<String?> investmentTypeId;
  final Value<int> rowid;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.transactionTypeId = const Value.absent(),
    this.amount = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.toSourceId = const Value.absent(),
    this.fee = const Value.absent(),
    this.feeSourceId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.needType = const Value.absent(),
    this.note = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.incomeSourceId = const Value.absent(),
    this.investmentTypeId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionsCompanion.insert({
    required String id,
    required String transactionTypeId,
    required double amount,
    required String sourceId,
    this.toSourceId = const Value.absent(),
    this.fee = const Value.absent(),
    this.feeSourceId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.needType = const Value.absent(),
    this.note = const Value.absent(),
    required DateTime timestamp,
    this.incomeSourceId = const Value.absent(),
    this.investmentTypeId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       transactionTypeId = Value(transactionTypeId),
       amount = Value(amount),
       sourceId = Value(sourceId),
       timestamp = Value(timestamp);
  static Insertable<Transaction> custom({
    Expression<String>? id,
    Expression<String>? transactionTypeId,
    Expression<double>? amount,
    Expression<String>? sourceId,
    Expression<String>? toSourceId,
    Expression<double>? fee,
    Expression<String>? feeSourceId,
    Expression<String>? categoryId,
    Expression<String>? needType,
    Expression<String>? note,
    Expression<DateTime>? timestamp,
    Expression<String>? incomeSourceId,
    Expression<String>? investmentTypeId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transactionTypeId != null) 'transaction_type_id': transactionTypeId,
      if (amount != null) 'amount': amount,
      if (sourceId != null) 'source_id': sourceId,
      if (toSourceId != null) 'to_source_id': toSourceId,
      if (fee != null) 'fee': fee,
      if (feeSourceId != null) 'fee_source_id': feeSourceId,
      if (categoryId != null) 'category_id': categoryId,
      if (needType != null) 'need_type': needType,
      if (note != null) 'note': note,
      if (timestamp != null) 'timestamp': timestamp,
      if (incomeSourceId != null) 'income_source_id': incomeSourceId,
      if (investmentTypeId != null) 'investment_type_id': investmentTypeId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionsCompanion copyWith({
    Value<String>? id,
    Value<String>? transactionTypeId,
    Value<double>? amount,
    Value<String>? sourceId,
    Value<String?>? toSourceId,
    Value<double?>? fee,
    Value<String?>? feeSourceId,
    Value<String?>? categoryId,
    Value<String?>? needType,
    Value<String?>? note,
    Value<DateTime>? timestamp,
    Value<String?>? incomeSourceId,
    Value<String?>? investmentTypeId,
    Value<int>? rowid,
  }) {
    return TransactionsCompanion(
      id: id ?? this.id,
      transactionTypeId: transactionTypeId ?? this.transactionTypeId,
      amount: amount ?? this.amount,
      sourceId: sourceId ?? this.sourceId,
      toSourceId: toSourceId ?? this.toSourceId,
      fee: fee ?? this.fee,
      feeSourceId: feeSourceId ?? this.feeSourceId,
      categoryId: categoryId ?? this.categoryId,
      needType: needType ?? this.needType,
      note: note ?? this.note,
      timestamp: timestamp ?? this.timestamp,
      incomeSourceId: incomeSourceId ?? this.incomeSourceId,
      investmentTypeId: investmentTypeId ?? this.investmentTypeId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (transactionTypeId.present) {
      map['transaction_type_id'] = Variable<String>(transactionTypeId.value);
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
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
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
    if (incomeSourceId.present) {
      map['income_source_id'] = Variable<String>(incomeSourceId.value);
    }
    if (investmentTypeId.present) {
      map['investment_type_id'] = Variable<String>(investmentTypeId.value);
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
          ..write('transactionTypeId: $transactionTypeId, ')
          ..write('amount: $amount, ')
          ..write('sourceId: $sourceId, ')
          ..write('toSourceId: $toSourceId, ')
          ..write('fee: $fee, ')
          ..write('feeSourceId: $feeSourceId, ')
          ..write('categoryId: $categoryId, ')
          ..write('needType: $needType, ')
          ..write('note: $note, ')
          ..write('timestamp: $timestamp, ')
          ..write('incomeSourceId: $incomeSourceId, ')
          ..write('investmentTypeId: $investmentTypeId, ')
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
    requiredDuringInsert: true,
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
    } else if (isInserting) {
      context.missing(_idMeta);
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
    required String id,
    required String name,
    this.phone = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
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
    requiredDuringInsert: true,
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES transactions (id) ON DELETE CASCADE',
    ),
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES persons (id)',
    ),
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
    } else if (isInserting) {
      context.missing(_idMeta);
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
    required String id,
    required String transactionId,
    required double amount,
    required String paidFor,
    this.personId = const Value.absent(),
    this.isSplitwise = const Value.absent(),
    this.category = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       transactionId = Value(transactionId),
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TransactionTypesTable transactionTypes = $TransactionTypesTable(
    this,
  );
  late final $SourceTypesTable sourceTypes = $SourceTypesTable(this);
  late final $SourceCategoriesTable sourceCategories = $SourceCategoriesTable(
    this,
  );
  late final $SourcesTable sources = $SourcesTable(this);
  late final $TransactionCategoriesTable transactionCategories =
      $TransactionCategoriesTable(this);
  late final $InvestmentTypesTable investmentTypes = $InvestmentTypesTable(
    this,
  );
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $PersonsTable persons = $PersonsTable(this);
  late final $SplitItemsTable splitItems = $SplitItemsTable(this);
  late final TransactionDao transactionDao = TransactionDao(
    this as AppDatabase,
  );
  late final SourceDao sourceDao = SourceDao(this as AppDatabase);
  late final PersonDao personDao = PersonDao(this as AppDatabase);
  late final SourceTypeDao sourceTypeDao = SourceTypeDao(this as AppDatabase);
  late final TransactionCategoryDao transactionCategoryDao =
      TransactionCategoryDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    transactionTypes,
    sourceTypes,
    sourceCategories,
    sources,
    transactionCategories,
    investmentTypes,
    transactions,
    persons,
    splitItems,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'transactions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('split_items', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$TransactionTypesTableCreateCompanionBuilder =
    TransactionTypesCompanion Function({
      required String id,
      required String name,
      Value<int> rowid,
    });
typedef $$TransactionTypesTableUpdateCompanionBuilder =
    TransactionTypesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> rowid,
    });

final class $$TransactionTypesTableReferences
    extends
        BaseReferences<_$AppDatabase, $TransactionTypesTable, TransactionType> {
  $$TransactionTypesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
  _transactionTypeTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: $_aliasNameGenerator(
      db.transactionTypes.id,
      db.transactions.transactionTypeId,
    ),
  );

  $$TransactionsTableProcessedTableManager get transactionType {
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter(
      (f) => f.transactionTypeId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_transactionTypeTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TransactionTypesTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionTypesTable> {
  $$TransactionTypesTableFilterComposer({
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

  Expression<bool> transactionType(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TransactionTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionTypesTable> {
  $$TransactionTypesTableOrderingComposer({
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
}

class $$TransactionTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionTypesTable> {
  $$TransactionTypesTableAnnotationComposer({
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

  Expression<T> transactionType<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.transactionTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TransactionTypesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionTypesTable,
          TransactionType,
          $$TransactionTypesTableFilterComposer,
          $$TransactionTypesTableOrderingComposer,
          $$TransactionTypesTableAnnotationComposer,
          $$TransactionTypesTableCreateCompanionBuilder,
          $$TransactionTypesTableUpdateCompanionBuilder,
          (TransactionType, $$TransactionTypesTableReferences),
          TransactionType,
          PrefetchHooks Function({bool transactionType})
        > {
  $$TransactionTypesTableTableManager(
    _$AppDatabase db,
    $TransactionTypesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$TransactionTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$TransactionTypesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$TransactionTypesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionTypesCompanion(id: id, name: name, rowid: rowid),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<int> rowid = const Value.absent(),
              }) => TransactionTypesCompanion.insert(
                id: id,
                name: name,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$TransactionTypesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({transactionType = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (transactionType) db.transactions],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionType)
                    await $_getPrefetchedData<
                      TransactionType,
                      $TransactionTypesTable,
                      Transaction
                    >(
                      currentTable: table,
                      referencedTable: $$TransactionTypesTableReferences
                          ._transactionTypeTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$TransactionTypesTableReferences(
                                db,
                                table,
                                p0,
                              ).transactionType,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.transactionTypeId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TransactionTypesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionTypesTable,
      TransactionType,
      $$TransactionTypesTableFilterComposer,
      $$TransactionTypesTableOrderingComposer,
      $$TransactionTypesTableAnnotationComposer,
      $$TransactionTypesTableCreateCompanionBuilder,
      $$TransactionTypesTableUpdateCompanionBuilder,
      (TransactionType, $$TransactionTypesTableReferences),
      TransactionType,
      PrefetchHooks Function({bool transactionType})
    >;
typedef $$SourceTypesTableCreateCompanionBuilder =
    SourceTypesCompanion Function({
      required String id,
      required String name,
      Value<int> rowid,
    });
typedef $$SourceTypesTableUpdateCompanionBuilder =
    SourceTypesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> rowid,
    });

final class $$SourceTypesTableReferences
    extends BaseReferences<_$AppDatabase, $SourceTypesTable, SourceType> {
  $$SourceTypesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SourcesTable, List<Source>> _sourceTypeTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.sources,
    aliasName: $_aliasNameGenerator(db.sourceTypes.id, db.sources.sourceTypeId),
  );

  $$SourcesTableProcessedTableManager get sourceType {
    final manager = $$SourcesTableTableManager(
      $_db,
      $_db.sources,
    ).filter((f) => f.sourceTypeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_sourceTypeTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SourceTypesTableFilterComposer
    extends Composer<_$AppDatabase, $SourceTypesTable> {
  $$SourceTypesTableFilterComposer({
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

  Expression<bool> sourceType(
    Expression<bool> Function($$SourcesTableFilterComposer f) f,
  ) {
    final $$SourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sources,
      getReferencedColumn: (t) => t.sourceTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourcesTableFilterComposer(
            $db: $db,
            $table: $db.sources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SourceTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $SourceTypesTable> {
  $$SourceTypesTableOrderingComposer({
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
}

class $$SourceTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SourceTypesTable> {
  $$SourceTypesTableAnnotationComposer({
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

  Expression<T> sourceType<T extends Object>(
    Expression<T> Function($$SourcesTableAnnotationComposer a) f,
  ) {
    final $$SourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sources,
      getReferencedColumn: (t) => t.sourceTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.sources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SourceTypesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SourceTypesTable,
          SourceType,
          $$SourceTypesTableFilterComposer,
          $$SourceTypesTableOrderingComposer,
          $$SourceTypesTableAnnotationComposer,
          $$SourceTypesTableCreateCompanionBuilder,
          $$SourceTypesTableUpdateCompanionBuilder,
          (SourceType, $$SourceTypesTableReferences),
          SourceType,
          PrefetchHooks Function({bool sourceType})
        > {
  $$SourceTypesTableTableManager(_$AppDatabase db, $SourceTypesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SourceTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SourceTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$SourceTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SourceTypesCompanion(id: id, name: name, rowid: rowid),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<int> rowid = const Value.absent(),
              }) =>
                  SourceTypesCompanion.insert(id: id, name: name, rowid: rowid),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$SourceTypesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({sourceType = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (sourceType) db.sources],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (sourceType)
                    await $_getPrefetchedData<
                      SourceType,
                      $SourceTypesTable,
                      Source
                    >(
                      currentTable: table,
                      referencedTable: $$SourceTypesTableReferences
                          ._sourceTypeTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$SourceTypesTableReferences(
                                db,
                                table,
                                p0,
                              ).sourceType,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.sourceTypeId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SourceTypesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SourceTypesTable,
      SourceType,
      $$SourceTypesTableFilterComposer,
      $$SourceTypesTableOrderingComposer,
      $$SourceTypesTableAnnotationComposer,
      $$SourceTypesTableCreateCompanionBuilder,
      $$SourceTypesTableUpdateCompanionBuilder,
      (SourceType, $$SourceTypesTableReferences),
      SourceType,
      PrefetchHooks Function({bool sourceType})
    >;
typedef $$SourceCategoriesTableCreateCompanionBuilder =
    SourceCategoriesCompanion Function({
      required String id,
      required String name,
      Value<int> rowid,
    });
typedef $$SourceCategoriesTableUpdateCompanionBuilder =
    SourceCategoriesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> rowid,
    });

final class $$SourceCategoriesTableReferences
    extends
        BaseReferences<_$AppDatabase, $SourceCategoriesTable, SourceCategory> {
  $$SourceCategoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$SourcesTable, List<Source>> _sourceCategoryTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.sources,
    aliasName: $_aliasNameGenerator(
      db.sourceCategories.id,
      db.sources.sourceCategoryId,
    ),
  );

  $$SourcesTableProcessedTableManager get sourceCategory {
    final manager = $$SourcesTableTableManager($_db, $_db.sources).filter(
      (f) => f.sourceCategoryId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_sourceCategoryTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SourceCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $SourceCategoriesTable> {
  $$SourceCategoriesTableFilterComposer({
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

  Expression<bool> sourceCategory(
    Expression<bool> Function($$SourcesTableFilterComposer f) f,
  ) {
    final $$SourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sources,
      getReferencedColumn: (t) => t.sourceCategoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourcesTableFilterComposer(
            $db: $db,
            $table: $db.sources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SourceCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $SourceCategoriesTable> {
  $$SourceCategoriesTableOrderingComposer({
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
}

class $$SourceCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SourceCategoriesTable> {
  $$SourceCategoriesTableAnnotationComposer({
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

  Expression<T> sourceCategory<T extends Object>(
    Expression<T> Function($$SourcesTableAnnotationComposer a) f,
  ) {
    final $$SourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sources,
      getReferencedColumn: (t) => t.sourceCategoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.sources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SourceCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SourceCategoriesTable,
          SourceCategory,
          $$SourceCategoriesTableFilterComposer,
          $$SourceCategoriesTableOrderingComposer,
          $$SourceCategoriesTableAnnotationComposer,
          $$SourceCategoriesTableCreateCompanionBuilder,
          $$SourceCategoriesTableUpdateCompanionBuilder,
          (SourceCategory, $$SourceCategoriesTableReferences),
          SourceCategory,
          PrefetchHooks Function({bool sourceCategory})
        > {
  $$SourceCategoriesTableTableManager(
    _$AppDatabase db,
    $SourceCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$SourceCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SourceCategoriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$SourceCategoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SourceCategoriesCompanion(id: id, name: name, rowid: rowid),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<int> rowid = const Value.absent(),
              }) => SourceCategoriesCompanion.insert(
                id: id,
                name: name,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$SourceCategoriesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({sourceCategory = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (sourceCategory) db.sources],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (sourceCategory)
                    await $_getPrefetchedData<
                      SourceCategory,
                      $SourceCategoriesTable,
                      Source
                    >(
                      currentTable: table,
                      referencedTable: $$SourceCategoriesTableReferences
                          ._sourceCategoryTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$SourceCategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).sourceCategory,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.sourceCategoryId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SourceCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SourceCategoriesTable,
      SourceCategory,
      $$SourceCategoriesTableFilterComposer,
      $$SourceCategoriesTableOrderingComposer,
      $$SourceCategoriesTableAnnotationComposer,
      $$SourceCategoriesTableCreateCompanionBuilder,
      $$SourceCategoriesTableUpdateCompanionBuilder,
      (SourceCategory, $$SourceCategoriesTableReferences),
      SourceCategory,
      PrefetchHooks Function({bool sourceCategory})
    >;
typedef $$SourcesTableCreateCompanionBuilder =
    SourcesCompanion Function({
      required String id,
      required String name,
      required String sourceTypeId,
      required String sourceCategoryId,
      Value<bool> isVirtual,
      Value<int> rowid,
    });
typedef $$SourcesTableUpdateCompanionBuilder =
    SourcesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> sourceTypeId,
      Value<String> sourceCategoryId,
      Value<bool> isVirtual,
      Value<int> rowid,
    });

final class $$SourcesTableReferences
    extends BaseReferences<_$AppDatabase, $SourcesTable, Source> {
  $$SourcesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SourceTypesTable _sourceTypeIdTable(_$AppDatabase db) =>
      db.sourceTypes.createAlias(
        $_aliasNameGenerator(db.sources.sourceTypeId, db.sourceTypes.id),
      );

  $$SourceTypesTableProcessedTableManager get sourceTypeId {
    final $_column = $_itemColumn<String>('source_type_id')!;

    final manager = $$SourceTypesTableTableManager(
      $_db,
      $_db.sourceTypes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SourceCategoriesTable _sourceCategoryIdTable(_$AppDatabase db) =>
      db.sourceCategories.createAlias(
        $_aliasNameGenerator(
          db.sources.sourceCategoryId,
          db.sourceCategories.id,
        ),
      );

  $$SourceCategoriesTableProcessedTableManager get sourceCategoryId {
    final $_column = $_itemColumn<String>('source_category_id')!;

    final manager = $$SourceCategoriesTableTableManager(
      $_db,
      $_db.sourceCategories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceCategoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
  _sourceTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: $_aliasNameGenerator(db.sources.id, db.transactions.sourceId),
  );

  $$TransactionsTableProcessedTableManager get source {
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.sourceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_sourceTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
  _destinationSourceTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: $_aliasNameGenerator(db.sources.id, db.transactions.toSourceId),
  );

  $$TransactionsTableProcessedTableManager get destinationSource {
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.toSourceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_destinationSourceTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
  _feeSourceTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: $_aliasNameGenerator(db.sources.id, db.transactions.feeSourceId),
  );

  $$TransactionsTableProcessedTableManager get feeSource {
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.feeSourceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_feeSourceTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
  _incomeSourceTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: $_aliasNameGenerator(
      db.sources.id,
      db.transactions.incomeSourceId,
    ),
  );

  $$TransactionsTableProcessedTableManager get incomeSource {
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.incomeSourceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_incomeSourceTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  ColumnFilters<bool> get isVirtual => $composableBuilder(
    column: $table.isVirtual,
    builder: (column) => ColumnFilters(column),
  );

  $$SourceTypesTableFilterComposer get sourceTypeId {
    final $$SourceTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceTypeId,
      referencedTable: $db.sourceTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourceTypesTableFilterComposer(
            $db: $db,
            $table: $db.sourceTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SourceCategoriesTableFilterComposer get sourceCategoryId {
    final $$SourceCategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceCategoryId,
      referencedTable: $db.sourceCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourceCategoriesTableFilterComposer(
            $db: $db,
            $table: $db.sourceCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> source(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> destinationSource(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.toSourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> feeSource(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.feeSourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> incomeSource(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.incomeSourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  ColumnOrderings<bool> get isVirtual => $composableBuilder(
    column: $table.isVirtual,
    builder: (column) => ColumnOrderings(column),
  );

  $$SourceTypesTableOrderingComposer get sourceTypeId {
    final $$SourceTypesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceTypeId,
      referencedTable: $db.sourceTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourceTypesTableOrderingComposer(
            $db: $db,
            $table: $db.sourceTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SourceCategoriesTableOrderingComposer get sourceCategoryId {
    final $$SourceCategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceCategoryId,
      referencedTable: $db.sourceCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourceCategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.sourceCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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

  GeneratedColumn<bool> get isVirtual =>
      $composableBuilder(column: $table.isVirtual, builder: (column) => column);

  $$SourceTypesTableAnnotationComposer get sourceTypeId {
    final $$SourceTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceTypeId,
      referencedTable: $db.sourceTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourceTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.sourceTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SourceCategoriesTableAnnotationComposer get sourceCategoryId {
    final $$SourceCategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceCategoryId,
      referencedTable: $db.sourceCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourceCategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.sourceCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> source<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> destinationSource<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.toSourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> feeSource<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.feeSourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> incomeSource<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.incomeSourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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
          (Source, $$SourcesTableReferences),
          Source,
          PrefetchHooks Function({
            bool sourceTypeId,
            bool sourceCategoryId,
            bool source,
            bool destinationSource,
            bool feeSource,
            bool incomeSource,
          })
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
                Value<String> sourceTypeId = const Value.absent(),
                Value<String> sourceCategoryId = const Value.absent(),
                Value<bool> isVirtual = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SourcesCompanion(
                id: id,
                name: name,
                sourceTypeId: sourceTypeId,
                sourceCategoryId: sourceCategoryId,
                isVirtual: isVirtual,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String sourceTypeId,
                required String sourceCategoryId,
                Value<bool> isVirtual = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SourcesCompanion.insert(
                id: id,
                name: name,
                sourceTypeId: sourceTypeId,
                sourceCategoryId: sourceCategoryId,
                isVirtual: isVirtual,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$SourcesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            sourceTypeId = false,
            sourceCategoryId = false,
            source = false,
            destinationSource = false,
            feeSource = false,
            incomeSource = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (source) db.transactions,
                if (destinationSource) db.transactions,
                if (feeSource) db.transactions,
                if (incomeSource) db.transactions,
              ],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (sourceTypeId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.sourceTypeId,
                            referencedTable: $$SourcesTableReferences
                                ._sourceTypeIdTable(db),
                            referencedColumn:
                                $$SourcesTableReferences
                                    ._sourceTypeIdTable(db)
                                    .id,
                          )
                          as T;
                }
                if (sourceCategoryId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.sourceCategoryId,
                            referencedTable: $$SourcesTableReferences
                                ._sourceCategoryIdTable(db),
                            referencedColumn:
                                $$SourcesTableReferences
                                    ._sourceCategoryIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (source)
                    await $_getPrefetchedData<
                      Source,
                      $SourcesTable,
                      Transaction
                    >(
                      currentTable: table,
                      referencedTable: $$SourcesTableReferences._sourceTable(
                        db,
                      ),
                      managerFromTypedResult:
                          (p0) =>
                              $$SourcesTableReferences(db, table, p0).source,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.sourceId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (destinationSource)
                    await $_getPrefetchedData<
                      Source,
                      $SourcesTable,
                      Transaction
                    >(
                      currentTable: table,
                      referencedTable: $$SourcesTableReferences
                          ._destinationSourceTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$SourcesTableReferences(
                                db,
                                table,
                                p0,
                              ).destinationSource,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.toSourceId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (feeSource)
                    await $_getPrefetchedData<
                      Source,
                      $SourcesTable,
                      Transaction
                    >(
                      currentTable: table,
                      referencedTable: $$SourcesTableReferences._feeSourceTable(
                        db,
                      ),
                      managerFromTypedResult:
                          (p0) =>
                              $$SourcesTableReferences(db, table, p0).feeSource,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.feeSourceId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (incomeSource)
                    await $_getPrefetchedData<
                      Source,
                      $SourcesTable,
                      Transaction
                    >(
                      currentTable: table,
                      referencedTable: $$SourcesTableReferences
                          ._incomeSourceTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$SourcesTableReferences(
                                db,
                                table,
                                p0,
                              ).incomeSource,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.incomeSourceId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
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
      (Source, $$SourcesTableReferences),
      Source,
      PrefetchHooks Function({
        bool sourceTypeId,
        bool sourceCategoryId,
        bool source,
        bool destinationSource,
        bool feeSource,
        bool incomeSource,
      })
    >;
typedef $$TransactionCategoriesTableCreateCompanionBuilder =
    TransactionCategoriesCompanion Function({
      required String id,
      required String name,
      Value<int> rowid,
    });
typedef $$TransactionCategoriesTableUpdateCompanionBuilder =
    TransactionCategoriesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> rowid,
    });

final class $$TransactionCategoriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $TransactionCategoriesTable,
          TransactionCategory
        > {
  $$TransactionCategoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
  _categoryTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: $_aliasNameGenerator(
      db.transactionCategories.id,
      db.transactions.categoryId,
    ),
  );

  $$TransactionsTableProcessedTableManager get category {
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_categoryTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TransactionCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionCategoriesTable> {
  $$TransactionCategoriesTableFilterComposer({
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

  Expression<bool> category(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TransactionCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionCategoriesTable> {
  $$TransactionCategoriesTableOrderingComposer({
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
}

class $$TransactionCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionCategoriesTable> {
  $$TransactionCategoriesTableAnnotationComposer({
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

  Expression<T> category<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TransactionCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionCategoriesTable,
          TransactionCategory,
          $$TransactionCategoriesTableFilterComposer,
          $$TransactionCategoriesTableOrderingComposer,
          $$TransactionCategoriesTableAnnotationComposer,
          $$TransactionCategoriesTableCreateCompanionBuilder,
          $$TransactionCategoriesTableUpdateCompanionBuilder,
          (TransactionCategory, $$TransactionCategoriesTableReferences),
          TransactionCategory,
          PrefetchHooks Function({bool category})
        > {
  $$TransactionCategoriesTableTableManager(
    _$AppDatabase db,
    $TransactionCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TransactionCategoriesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$TransactionCategoriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$TransactionCategoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionCategoriesCompanion(
                id: id,
                name: name,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<int> rowid = const Value.absent(),
              }) => TransactionCategoriesCompanion.insert(
                id: id,
                name: name,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$TransactionCategoriesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({category = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (category) db.transactions],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (category)
                    await $_getPrefetchedData<
                      TransactionCategory,
                      $TransactionCategoriesTable,
                      Transaction
                    >(
                      currentTable: table,
                      referencedTable: $$TransactionCategoriesTableReferences
                          ._categoryTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$TransactionCategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).category,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.categoryId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TransactionCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionCategoriesTable,
      TransactionCategory,
      $$TransactionCategoriesTableFilterComposer,
      $$TransactionCategoriesTableOrderingComposer,
      $$TransactionCategoriesTableAnnotationComposer,
      $$TransactionCategoriesTableCreateCompanionBuilder,
      $$TransactionCategoriesTableUpdateCompanionBuilder,
      (TransactionCategory, $$TransactionCategoriesTableReferences),
      TransactionCategory,
      PrefetchHooks Function({bool category})
    >;
typedef $$InvestmentTypesTableCreateCompanionBuilder =
    InvestmentTypesCompanion Function({
      required String id,
      required String name,
      Value<int> rowid,
    });
typedef $$InvestmentTypesTableUpdateCompanionBuilder =
    InvestmentTypesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> rowid,
    });

final class $$InvestmentTypesTableReferences
    extends
        BaseReferences<_$AppDatabase, $InvestmentTypesTable, InvestmentType> {
  $$InvestmentTypesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$TransactionsTable, List<Transaction>>
  _investmentTypeTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transactions,
    aliasName: $_aliasNameGenerator(
      db.investmentTypes.id,
      db.transactions.investmentTypeId,
    ),
  );

  $$TransactionsTableProcessedTableManager get investmentType {
    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter(
      (f) => f.investmentTypeId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_investmentTypeTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$InvestmentTypesTableFilterComposer
    extends Composer<_$AppDatabase, $InvestmentTypesTable> {
  $$InvestmentTypesTableFilterComposer({
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

  Expression<bool> investmentType(
    Expression<bool> Function($$TransactionsTableFilterComposer f) f,
  ) {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.investmentTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InvestmentTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $InvestmentTypesTable> {
  $$InvestmentTypesTableOrderingComposer({
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
}

class $$InvestmentTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvestmentTypesTable> {
  $$InvestmentTypesTableAnnotationComposer({
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

  Expression<T> investmentType<T extends Object>(
    Expression<T> Function($$TransactionsTableAnnotationComposer a) f,
  ) {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.investmentTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InvestmentTypesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InvestmentTypesTable,
          InvestmentType,
          $$InvestmentTypesTableFilterComposer,
          $$InvestmentTypesTableOrderingComposer,
          $$InvestmentTypesTableAnnotationComposer,
          $$InvestmentTypesTableCreateCompanionBuilder,
          $$InvestmentTypesTableUpdateCompanionBuilder,
          (InvestmentType, $$InvestmentTypesTableReferences),
          InvestmentType,
          PrefetchHooks Function({bool investmentType})
        > {
  $$InvestmentTypesTableTableManager(
    _$AppDatabase db,
    $InvestmentTypesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$InvestmentTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$InvestmentTypesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$InvestmentTypesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InvestmentTypesCompanion(id: id, name: name, rowid: rowid),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<int> rowid = const Value.absent(),
              }) => InvestmentTypesCompanion.insert(
                id: id,
                name: name,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$InvestmentTypesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({investmentType = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (investmentType) db.transactions],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (investmentType)
                    await $_getPrefetchedData<
                      InvestmentType,
                      $InvestmentTypesTable,
                      Transaction
                    >(
                      currentTable: table,
                      referencedTable: $$InvestmentTypesTableReferences
                          ._investmentTypeTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$InvestmentTypesTableReferences(
                                db,
                                table,
                                p0,
                              ).investmentType,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.investmentTypeId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$InvestmentTypesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InvestmentTypesTable,
      InvestmentType,
      $$InvestmentTypesTableFilterComposer,
      $$InvestmentTypesTableOrderingComposer,
      $$InvestmentTypesTableAnnotationComposer,
      $$InvestmentTypesTableCreateCompanionBuilder,
      $$InvestmentTypesTableUpdateCompanionBuilder,
      (InvestmentType, $$InvestmentTypesTableReferences),
      InvestmentType,
      PrefetchHooks Function({bool investmentType})
    >;
typedef $$TransactionsTableCreateCompanionBuilder =
    TransactionsCompanion Function({
      required String id,
      required String transactionTypeId,
      required double amount,
      required String sourceId,
      Value<String?> toSourceId,
      Value<double?> fee,
      Value<String?> feeSourceId,
      Value<String?> categoryId,
      Value<String?> needType,
      Value<String?> note,
      required DateTime timestamp,
      Value<String?> incomeSourceId,
      Value<String?> investmentTypeId,
      Value<int> rowid,
    });
typedef $$TransactionsTableUpdateCompanionBuilder =
    TransactionsCompanion Function({
      Value<String> id,
      Value<String> transactionTypeId,
      Value<double> amount,
      Value<String> sourceId,
      Value<String?> toSourceId,
      Value<double?> fee,
      Value<String?> feeSourceId,
      Value<String?> categoryId,
      Value<String?> needType,
      Value<String?> note,
      Value<DateTime> timestamp,
      Value<String?> incomeSourceId,
      Value<String?> investmentTypeId,
      Value<int> rowid,
    });

final class $$TransactionsTableReferences
    extends BaseReferences<_$AppDatabase, $TransactionsTable, Transaction> {
  $$TransactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TransactionTypesTable _transactionTypeIdTable(_$AppDatabase db) =>
      db.transactionTypes.createAlias(
        $_aliasNameGenerator(
          db.transactions.transactionTypeId,
          db.transactionTypes.id,
        ),
      );

  $$TransactionTypesTableProcessedTableManager get transactionTypeId {
    final $_column = $_itemColumn<String>('transaction_type_id')!;

    final manager = $$TransactionTypesTableTableManager(
      $_db,
      $_db.transactionTypes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transactionTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SourcesTable _sourceIdTable(_$AppDatabase db) =>
      db.sources.createAlias(
        $_aliasNameGenerator(db.transactions.sourceId, db.sources.id),
      );

  $$SourcesTableProcessedTableManager get sourceId {
    final $_column = $_itemColumn<String>('source_id')!;

    final manager = $$SourcesTableTableManager(
      $_db,
      $_db.sources,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SourcesTable _toSourceIdTable(_$AppDatabase db) =>
      db.sources.createAlias(
        $_aliasNameGenerator(db.transactions.toSourceId, db.sources.id),
      );

  $$SourcesTableProcessedTableManager? get toSourceId {
    final $_column = $_itemColumn<String>('to_source_id');
    if ($_column == null) return null;
    final manager = $$SourcesTableTableManager(
      $_db,
      $_db.sources,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_toSourceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SourcesTable _feeSourceIdTable(_$AppDatabase db) =>
      db.sources.createAlias(
        $_aliasNameGenerator(db.transactions.feeSourceId, db.sources.id),
      );

  $$SourcesTableProcessedTableManager? get feeSourceId {
    final $_column = $_itemColumn<String>('fee_source_id');
    if ($_column == null) return null;
    final manager = $$SourcesTableTableManager(
      $_db,
      $_db.sources,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_feeSourceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TransactionCategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.transactionCategories.createAlias(
        $_aliasNameGenerator(
          db.transactions.categoryId,
          db.transactionCategories.id,
        ),
      );

  $$TransactionCategoriesTableProcessedTableManager? get categoryId {
    final $_column = $_itemColumn<String>('category_id');
    if ($_column == null) return null;
    final manager = $$TransactionCategoriesTableTableManager(
      $_db,
      $_db.transactionCategories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SourcesTable _incomeSourceIdTable(_$AppDatabase db) =>
      db.sources.createAlias(
        $_aliasNameGenerator(db.transactions.incomeSourceId, db.sources.id),
      );

  $$SourcesTableProcessedTableManager? get incomeSourceId {
    final $_column = $_itemColumn<String>('income_source_id');
    if ($_column == null) return null;
    final manager = $$SourcesTableTableManager(
      $_db,
      $_db.sources,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_incomeSourceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $InvestmentTypesTable _investmentTypeIdTable(_$AppDatabase db) =>
      db.investmentTypes.createAlias(
        $_aliasNameGenerator(
          db.transactions.investmentTypeId,
          db.investmentTypes.id,
        ),
      );

  $$InvestmentTypesTableProcessedTableManager? get investmentTypeId {
    final $_column = $_itemColumn<String>('investment_type_id');
    if ($_column == null) return null;
    final manager = $$InvestmentTypesTableTableManager(
      $_db,
      $_db.investmentTypes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_investmentTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SplitItemsTable, List<SplitItem>>
  _transactionTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.splitItems,
    aliasName: $_aliasNameGenerator(
      db.transactions.id,
      db.splitItems.transactionId,
    ),
  );

  $$SplitItemsTableProcessedTableManager get transaction {
    final manager = $$SplitItemsTableTableManager(
      $_db,
      $_db.splitItems,
    ).filter((f) => f.transactionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_transactionTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fee => $composableBuilder(
    column: $table.fee,
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

  $$TransactionTypesTableFilterComposer get transactionTypeId {
    final $$TransactionTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionTypeId,
      referencedTable: $db.transactionTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionTypesTableFilterComposer(
            $db: $db,
            $table: $db.transactionTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SourcesTableFilterComposer get sourceId {
    final $$SourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.sources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourcesTableFilterComposer(
            $db: $db,
            $table: $db.sources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SourcesTableFilterComposer get toSourceId {
    final $$SourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.toSourceId,
      referencedTable: $db.sources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourcesTableFilterComposer(
            $db: $db,
            $table: $db.sources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SourcesTableFilterComposer get feeSourceId {
    final $$SourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.feeSourceId,
      referencedTable: $db.sources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourcesTableFilterComposer(
            $db: $db,
            $table: $db.sources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionCategoriesTableFilterComposer get categoryId {
    final $$TransactionCategoriesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.categoryId,
          referencedTable: $db.transactionCategories,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionCategoriesTableFilterComposer(
                $db: $db,
                $table: $db.transactionCategories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$SourcesTableFilterComposer get incomeSourceId {
    final $$SourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.incomeSourceId,
      referencedTable: $db.sources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourcesTableFilterComposer(
            $db: $db,
            $table: $db.sources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InvestmentTypesTableFilterComposer get investmentTypeId {
    final $$InvestmentTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.investmentTypeId,
      referencedTable: $db.investmentTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvestmentTypesTableFilterComposer(
            $db: $db,
            $table: $db.investmentTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> transaction(
    Expression<bool> Function($$SplitItemsTableFilterComposer f) f,
  ) {
    final $$SplitItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.splitItems,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SplitItemsTableFilterComposer(
            $db: $db,
            $table: $db.splitItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fee => $composableBuilder(
    column: $table.fee,
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

  $$TransactionTypesTableOrderingComposer get transactionTypeId {
    final $$TransactionTypesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionTypeId,
      referencedTable: $db.transactionTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionTypesTableOrderingComposer(
            $db: $db,
            $table: $db.transactionTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SourcesTableOrderingComposer get sourceId {
    final $$SourcesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.sources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourcesTableOrderingComposer(
            $db: $db,
            $table: $db.sources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SourcesTableOrderingComposer get toSourceId {
    final $$SourcesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.toSourceId,
      referencedTable: $db.sources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourcesTableOrderingComposer(
            $db: $db,
            $table: $db.sources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SourcesTableOrderingComposer get feeSourceId {
    final $$SourcesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.feeSourceId,
      referencedTable: $db.sources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourcesTableOrderingComposer(
            $db: $db,
            $table: $db.sources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionCategoriesTableOrderingComposer get categoryId {
    final $$TransactionCategoriesTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.categoryId,
          referencedTable: $db.transactionCategories,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionCategoriesTableOrderingComposer(
                $db: $db,
                $table: $db.transactionCategories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$SourcesTableOrderingComposer get incomeSourceId {
    final $$SourcesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.incomeSourceId,
      referencedTable: $db.sources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourcesTableOrderingComposer(
            $db: $db,
            $table: $db.sources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InvestmentTypesTableOrderingComposer get investmentTypeId {
    final $$InvestmentTypesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.investmentTypeId,
      referencedTable: $db.investmentTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvestmentTypesTableOrderingComposer(
            $db: $db,
            $table: $db.investmentTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<double> get fee =>
      $composableBuilder(column: $table.fee, builder: (column) => column);

  GeneratedColumn<String> get needType =>
      $composableBuilder(column: $table.needType, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  $$TransactionTypesTableAnnotationComposer get transactionTypeId {
    final $$TransactionTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionTypeId,
      referencedTable: $db.transactionTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.transactionTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SourcesTableAnnotationComposer get sourceId {
    final $$SourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.sources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.sources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SourcesTableAnnotationComposer get toSourceId {
    final $$SourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.toSourceId,
      referencedTable: $db.sources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.sources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SourcesTableAnnotationComposer get feeSourceId {
    final $$SourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.feeSourceId,
      referencedTable: $db.sources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.sources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TransactionCategoriesTableAnnotationComposer get categoryId {
    final $$TransactionCategoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.categoryId,
          referencedTable: $db.transactionCategories,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TransactionCategoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.transactionCategories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$SourcesTableAnnotationComposer get incomeSourceId {
    final $$SourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.incomeSourceId,
      referencedTable: $db.sources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.sources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InvestmentTypesTableAnnotationComposer get investmentTypeId {
    final $$InvestmentTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.investmentTypeId,
      referencedTable: $db.investmentTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvestmentTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.investmentTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> transaction<T extends Object>(
    Expression<T> Function($$SplitItemsTableAnnotationComposer a) f,
  ) {
    final $$SplitItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.splitItems,
      getReferencedColumn: (t) => t.transactionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SplitItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.splitItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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
          (Transaction, $$TransactionsTableReferences),
          Transaction,
          PrefetchHooks Function({
            bool transactionTypeId,
            bool sourceId,
            bool toSourceId,
            bool feeSourceId,
            bool categoryId,
            bool incomeSourceId,
            bool investmentTypeId,
            bool transaction,
          })
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
                Value<String> transactionTypeId = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> sourceId = const Value.absent(),
                Value<String?> toSourceId = const Value.absent(),
                Value<double?> fee = const Value.absent(),
                Value<String?> feeSourceId = const Value.absent(),
                Value<String?> categoryId = const Value.absent(),
                Value<String?> needType = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<String?> incomeSourceId = const Value.absent(),
                Value<String?> investmentTypeId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionsCompanion(
                id: id,
                transactionTypeId: transactionTypeId,
                amount: amount,
                sourceId: sourceId,
                toSourceId: toSourceId,
                fee: fee,
                feeSourceId: feeSourceId,
                categoryId: categoryId,
                needType: needType,
                note: note,
                timestamp: timestamp,
                incomeSourceId: incomeSourceId,
                investmentTypeId: investmentTypeId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String transactionTypeId,
                required double amount,
                required String sourceId,
                Value<String?> toSourceId = const Value.absent(),
                Value<double?> fee = const Value.absent(),
                Value<String?> feeSourceId = const Value.absent(),
                Value<String?> categoryId = const Value.absent(),
                Value<String?> needType = const Value.absent(),
                Value<String?> note = const Value.absent(),
                required DateTime timestamp,
                Value<String?> incomeSourceId = const Value.absent(),
                Value<String?> investmentTypeId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransactionsCompanion.insert(
                id: id,
                transactionTypeId: transactionTypeId,
                amount: amount,
                sourceId: sourceId,
                toSourceId: toSourceId,
                fee: fee,
                feeSourceId: feeSourceId,
                categoryId: categoryId,
                needType: needType,
                note: note,
                timestamp: timestamp,
                incomeSourceId: incomeSourceId,
                investmentTypeId: investmentTypeId,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$TransactionsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            transactionTypeId = false,
            sourceId = false,
            toSourceId = false,
            feeSourceId = false,
            categoryId = false,
            incomeSourceId = false,
            investmentTypeId = false,
            transaction = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (transaction) db.splitItems],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (transactionTypeId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.transactionTypeId,
                            referencedTable: $$TransactionsTableReferences
                                ._transactionTypeIdTable(db),
                            referencedColumn:
                                $$TransactionsTableReferences
                                    ._transactionTypeIdTable(db)
                                    .id,
                          )
                          as T;
                }
                if (sourceId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.sourceId,
                            referencedTable: $$TransactionsTableReferences
                                ._sourceIdTable(db),
                            referencedColumn:
                                $$TransactionsTableReferences
                                    ._sourceIdTable(db)
                                    .id,
                          )
                          as T;
                }
                if (toSourceId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.toSourceId,
                            referencedTable: $$TransactionsTableReferences
                                ._toSourceIdTable(db),
                            referencedColumn:
                                $$TransactionsTableReferences
                                    ._toSourceIdTable(db)
                                    .id,
                          )
                          as T;
                }
                if (feeSourceId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.feeSourceId,
                            referencedTable: $$TransactionsTableReferences
                                ._feeSourceIdTable(db),
                            referencedColumn:
                                $$TransactionsTableReferences
                                    ._feeSourceIdTable(db)
                                    .id,
                          )
                          as T;
                }
                if (categoryId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.categoryId,
                            referencedTable: $$TransactionsTableReferences
                                ._categoryIdTable(db),
                            referencedColumn:
                                $$TransactionsTableReferences
                                    ._categoryIdTable(db)
                                    .id,
                          )
                          as T;
                }
                if (incomeSourceId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.incomeSourceId,
                            referencedTable: $$TransactionsTableReferences
                                ._incomeSourceIdTable(db),
                            referencedColumn:
                                $$TransactionsTableReferences
                                    ._incomeSourceIdTable(db)
                                    .id,
                          )
                          as T;
                }
                if (investmentTypeId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.investmentTypeId,
                            referencedTable: $$TransactionsTableReferences
                                ._investmentTypeIdTable(db),
                            referencedColumn:
                                $$TransactionsTableReferences
                                    ._investmentTypeIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transaction)
                    await $_getPrefetchedData<
                      Transaction,
                      $TransactionsTable,
                      SplitItem
                    >(
                      currentTable: table,
                      referencedTable: $$TransactionsTableReferences
                          ._transactionTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$TransactionsTableReferences(
                                db,
                                table,
                                p0,
                              ).transaction,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.transactionId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
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
      (Transaction, $$TransactionsTableReferences),
      Transaction,
      PrefetchHooks Function({
        bool transactionTypeId,
        bool sourceId,
        bool toSourceId,
        bool feeSourceId,
        bool categoryId,
        bool incomeSourceId,
        bool investmentTypeId,
        bool transaction,
      })
    >;
typedef $$PersonsTableCreateCompanionBuilder =
    PersonsCompanion Function({
      required String id,
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

final class $$PersonsTableReferences
    extends BaseReferences<_$AppDatabase, $PersonsTable, Person> {
  $$PersonsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SplitItemsTable, List<SplitItem>> _personTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.splitItems,
    aliasName: $_aliasNameGenerator(db.persons.id, db.splitItems.personId),
  );

  $$SplitItemsTableProcessedTableManager get person {
    final manager = $$SplitItemsTableTableManager(
      $_db,
      $_db.splitItems,
    ).filter((f) => f.personId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_personTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  Expression<bool> person(
    Expression<bool> Function($$SplitItemsTableFilterComposer f) f,
  ) {
    final $$SplitItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.splitItems,
      getReferencedColumn: (t) => t.personId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SplitItemsTableFilterComposer(
            $db: $db,
            $table: $db.splitItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  Expression<T> person<T extends Object>(
    Expression<T> Function($$SplitItemsTableAnnotationComposer a) f,
  ) {
    final $$SplitItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.splitItems,
      getReferencedColumn: (t) => t.personId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SplitItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.splitItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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
          (Person, $$PersonsTableReferences),
          Person,
          PrefetchHooks Function({bool person})
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
                required String id,
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
                          $$PersonsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({person = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (person) db.splitItems],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (person)
                    await $_getPrefetchedData<Person, $PersonsTable, SplitItem>(
                      currentTable: table,
                      referencedTable: $$PersonsTableReferences._personTable(
                        db,
                      ),
                      managerFromTypedResult:
                          (p0) =>
                              $$PersonsTableReferences(db, table, p0).person,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.personId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
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
      (Person, $$PersonsTableReferences),
      Person,
      PrefetchHooks Function({bool person})
    >;
typedef $$SplitItemsTableCreateCompanionBuilder =
    SplitItemsCompanion Function({
      required String id,
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

final class $$SplitItemsTableReferences
    extends BaseReferences<_$AppDatabase, $SplitItemsTable, SplitItem> {
  $$SplitItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TransactionsTable _transactionIdTable(_$AppDatabase db) =>
      db.transactions.createAlias(
        $_aliasNameGenerator(db.splitItems.transactionId, db.transactions.id),
      );

  $$TransactionsTableProcessedTableManager get transactionId {
    final $_column = $_itemColumn<String>('transaction_id')!;

    final manager = $$TransactionsTableTableManager(
      $_db,
      $_db.transactions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PersonsTable _personIdTable(_$AppDatabase db) => db.persons
      .createAlias($_aliasNameGenerator(db.splitItems.personId, db.persons.id));

  $$PersonsTableProcessedTableManager? get personId {
    final $_column = $_itemColumn<String>('person_id');
    if ($_column == null) return null;
    final manager = $$PersonsTableTableManager(
      $_db,
      $_db.persons,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_personIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

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

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paidFor => $composableBuilder(
    column: $table.paidFor,
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

  $$TransactionsTableFilterComposer get transactionId {
    final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableFilterComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PersonsTableFilterComposer get personId {
    final $$PersonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.persons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonsTableFilterComposer(
            $db: $db,
            $table: $db.persons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paidFor => $composableBuilder(
    column: $table.paidFor,
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

  $$TransactionsTableOrderingComposer get transactionId {
    final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableOrderingComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PersonsTableOrderingComposer get personId {
    final $$PersonsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.persons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonsTableOrderingComposer(
            $db: $db,
            $table: $db.persons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get paidFor =>
      $composableBuilder(column: $table.paidFor, builder: (column) => column);

  GeneratedColumn<bool> get isSplitwise => $composableBuilder(
    column: $table.isSplitwise,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  $$TransactionsTableAnnotationComposer get transactionId {
    final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.transactions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PersonsTableAnnotationComposer get personId {
    final $$PersonsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personId,
      referencedTable: $db.persons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonsTableAnnotationComposer(
            $db: $db,
            $table: $db.persons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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
          (SplitItem, $$SplitItemsTableReferences),
          SplitItem,
          PrefetchHooks Function({bool transactionId, bool personId})
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
                required String id,
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
                          $$SplitItemsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({transactionId = false, personId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (transactionId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.transactionId,
                            referencedTable: $$SplitItemsTableReferences
                                ._transactionIdTable(db),
                            referencedColumn:
                                $$SplitItemsTableReferences
                                    ._transactionIdTable(db)
                                    .id,
                          )
                          as T;
                }
                if (personId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.personId,
                            referencedTable: $$SplitItemsTableReferences
                                ._personIdTable(db),
                            referencedColumn:
                                $$SplitItemsTableReferences
                                    ._personIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
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
      (SplitItem, $$SplitItemsTableReferences),
      SplitItem,
      PrefetchHooks Function({bool transactionId, bool personId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TransactionTypesTableTableManager get transactionTypes =>
      $$TransactionTypesTableTableManager(_db, _db.transactionTypes);
  $$SourceTypesTableTableManager get sourceTypes =>
      $$SourceTypesTableTableManager(_db, _db.sourceTypes);
  $$SourceCategoriesTableTableManager get sourceCategories =>
      $$SourceCategoriesTableTableManager(_db, _db.sourceCategories);
  $$SourcesTableTableManager get sources =>
      $$SourcesTableTableManager(_db, _db.sources);
  $$TransactionCategoriesTableTableManager get transactionCategories =>
      $$TransactionCategoriesTableTableManager(_db, _db.transactionCategories);
  $$InvestmentTypesTableTableManager get investmentTypes =>
      $$InvestmentTypesTableTableManager(_db, _db.investmentTypes);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$PersonsTableTableManager get persons =>
      $$PersonsTableTableManager(_db, _db.persons);
  $$SplitItemsTableTableManager get splitItems =>
      $$SplitItemsTableTableManager(_db, _db.splitItems);
}
