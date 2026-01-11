// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_servise.dart';

// ignore_for_file: type=lint
class $ContactosTablaTable extends ContactosTabla
    with TableInfo<$ContactosTablaTable, ContactosTablaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContactosTablaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fotoMeta = const VerificationMeta('foto');
  @override
  late final GeneratedColumn<String> foto = GeneratedColumn<String>(
    'foto',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _telefonoMeta = const VerificationMeta(
    'telefono',
  );
  @override
  late final GeneratedColumn<String> telefono = GeneratedColumn<String>(
    'telefono',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _favoritoMeta = const VerificationMeta(
    'favorito',
  );
  @override
  late final GeneratedColumn<bool> favorito = GeneratedColumn<bool>(
    'favorito',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("favorito" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nombre,
    descripcion,
    foto,
    telefono,
    email,
    favorito,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'contactos_tabla';
  @override
  VerificationContext validateIntegrity(
    Insertable<ContactosTablaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    }
    if (data.containsKey('foto')) {
      context.handle(
        _fotoMeta,
        foto.isAcceptableOrUnknown(data['foto']!, _fotoMeta),
      );
    }
    if (data.containsKey('telefono')) {
      context.handle(
        _telefonoMeta,
        telefono.isAcceptableOrUnknown(data['telefono']!, _telefonoMeta),
      );
    } else if (isInserting) {
      context.missing(_telefonoMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('favorito')) {
      context.handle(
        _favoritoMeta,
        favorito.isAcceptableOrUnknown(data['favorito']!, _favoritoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ContactosTablaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContactosTablaData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      ),
      foto: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}foto'],
      ),
      telefono: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}telefono'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      favorito: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}favorito'],
      )!,
    );
  }

  @override
  $ContactosTablaTable createAlias(String alias) {
    return $ContactosTablaTable(attachedDatabase, alias);
  }
}

class ContactosTablaData extends DataClass
    implements Insertable<ContactosTablaData> {
  final int id;
  final String nombre;
  final String? descripcion;
  final String? foto;
  final String telefono;
  final String email;
  final bool favorito;
  const ContactosTablaData({
    required this.id,
    required this.nombre,
    this.descripcion,
    this.foto,
    required this.telefono,
    required this.email,
    required this.favorito,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre'] = Variable<String>(nombre);
    if (!nullToAbsent || descripcion != null) {
      map['descripcion'] = Variable<String>(descripcion);
    }
    if (!nullToAbsent || foto != null) {
      map['foto'] = Variable<String>(foto);
    }
    map['telefono'] = Variable<String>(telefono);
    map['email'] = Variable<String>(email);
    map['favorito'] = Variable<bool>(favorito);
    return map;
  }

  ContactosTablaCompanion toCompanion(bool nullToAbsent) {
    return ContactosTablaCompanion(
      id: Value(id),
      nombre: Value(nombre),
      descripcion: descripcion == null && nullToAbsent
          ? const Value.absent()
          : Value(descripcion),
      foto: foto == null && nullToAbsent ? const Value.absent() : Value(foto),
      telefono: Value(telefono),
      email: Value(email),
      favorito: Value(favorito),
    );
  }

  factory ContactosTablaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContactosTablaData(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
      descripcion: serializer.fromJson<String?>(json['descripcion']),
      foto: serializer.fromJson<String?>(json['foto']),
      telefono: serializer.fromJson<String>(json['telefono']),
      email: serializer.fromJson<String>(json['email']),
      favorito: serializer.fromJson<bool>(json['favorito']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String>(nombre),
      'descripcion': serializer.toJson<String?>(descripcion),
      'foto': serializer.toJson<String?>(foto),
      'telefono': serializer.toJson<String>(telefono),
      'email': serializer.toJson<String>(email),
      'favorito': serializer.toJson<bool>(favorito),
    };
  }

  ContactosTablaData copyWith({
    int? id,
    String? nombre,
    Value<String?> descripcion = const Value.absent(),
    Value<String?> foto = const Value.absent(),
    String? telefono,
    String? email,
    bool? favorito,
  }) => ContactosTablaData(
    id: id ?? this.id,
    nombre: nombre ?? this.nombre,
    descripcion: descripcion.present ? descripcion.value : this.descripcion,
    foto: foto.present ? foto.value : this.foto,
    telefono: telefono ?? this.telefono,
    email: email ?? this.email,
    favorito: favorito ?? this.favorito,
  );
  ContactosTablaData copyWithCompanion(ContactosTablaCompanion data) {
    return ContactosTablaData(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
      foto: data.foto.present ? data.foto.value : this.foto,
      telefono: data.telefono.present ? data.telefono.value : this.telefono,
      email: data.email.present ? data.email.value : this.email,
      favorito: data.favorito.present ? data.favorito.value : this.favorito,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContactosTablaData(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('descripcion: $descripcion, ')
          ..write('foto: $foto, ')
          ..write('telefono: $telefono, ')
          ..write('email: $email, ')
          ..write('favorito: $favorito')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, nombre, descripcion, foto, telefono, email, favorito);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContactosTablaData &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.descripcion == this.descripcion &&
          other.foto == this.foto &&
          other.telefono == this.telefono &&
          other.email == this.email &&
          other.favorito == this.favorito);
}

class ContactosTablaCompanion extends UpdateCompanion<ContactosTablaData> {
  final Value<int> id;
  final Value<String> nombre;
  final Value<String?> descripcion;
  final Value<String?> foto;
  final Value<String> telefono;
  final Value<String> email;
  final Value<bool> favorito;
  const ContactosTablaCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.foto = const Value.absent(),
    this.telefono = const Value.absent(),
    this.email = const Value.absent(),
    this.favorito = const Value.absent(),
  });
  ContactosTablaCompanion.insert({
    this.id = const Value.absent(),
    required String nombre,
    this.descripcion = const Value.absent(),
    this.foto = const Value.absent(),
    required String telefono,
    required String email,
    this.favorito = const Value.absent(),
  }) : nombre = Value(nombre),
       telefono = Value(telefono),
       email = Value(email);
  static Insertable<ContactosTablaData> custom({
    Expression<int>? id,
    Expression<String>? nombre,
    Expression<String>? descripcion,
    Expression<String>? foto,
    Expression<String>? telefono,
    Expression<String>? email,
    Expression<bool>? favorito,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (descripcion != null) 'descripcion': descripcion,
      if (foto != null) 'foto': foto,
      if (telefono != null) 'telefono': telefono,
      if (email != null) 'email': email,
      if (favorito != null) 'favorito': favorito,
    });
  }

  ContactosTablaCompanion copyWith({
    Value<int>? id,
    Value<String>? nombre,
    Value<String?>? descripcion,
    Value<String?>? foto,
    Value<String>? telefono,
    Value<String>? email,
    Value<bool>? favorito,
  }) {
    return ContactosTablaCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
      foto: foto ?? this.foto,
      telefono: telefono ?? this.telefono,
      email: email ?? this.email,
      favorito: favorito ?? this.favorito,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (foto.present) {
      map['foto'] = Variable<String>(foto.value);
    }
    if (telefono.present) {
      map['telefono'] = Variable<String>(telefono.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (favorito.present) {
      map['favorito'] = Variable<bool>(favorito.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContactosTablaCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('descripcion: $descripcion, ')
          ..write('foto: $foto, ')
          ..write('telefono: $telefono, ')
          ..write('email: $email, ')
          ..write('favorito: $favorito')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftService extends GeneratedDatabase {
  _$DriftService(QueryExecutor e) : super(e);
  $DriftServiceManager get managers => $DriftServiceManager(this);
  late final $ContactosTablaTable contactosTabla = $ContactosTablaTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [contactosTabla];
}

typedef $$ContactosTablaTableCreateCompanionBuilder =
    ContactosTablaCompanion Function({
      Value<int> id,
      required String nombre,
      Value<String?> descripcion,
      Value<String?> foto,
      required String telefono,
      required String email,
      Value<bool> favorito,
    });
typedef $$ContactosTablaTableUpdateCompanionBuilder =
    ContactosTablaCompanion Function({
      Value<int> id,
      Value<String> nombre,
      Value<String?> descripcion,
      Value<String?> foto,
      Value<String> telefono,
      Value<String> email,
      Value<bool> favorito,
    });

class $$ContactosTablaTableFilterComposer
    extends Composer<_$DriftService, $ContactosTablaTable> {
  $$ContactosTablaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get foto => $composableBuilder(
    column: $table.foto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get favorito => $composableBuilder(
    column: $table.favorito,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ContactosTablaTableOrderingComposer
    extends Composer<_$DriftService, $ContactosTablaTable> {
  $$ContactosTablaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get foto => $composableBuilder(
    column: $table.foto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get favorito => $composableBuilder(
    column: $table.favorito,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ContactosTablaTableAnnotationComposer
    extends Composer<_$DriftService, $ContactosTablaTable> {
  $$ContactosTablaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get foto =>
      $composableBuilder(column: $table.foto, builder: (column) => column);

  GeneratedColumn<String> get telefono =>
      $composableBuilder(column: $table.telefono, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<bool> get favorito =>
      $composableBuilder(column: $table.favorito, builder: (column) => column);
}

class $$ContactosTablaTableTableManager
    extends
        RootTableManager<
          _$DriftService,
          $ContactosTablaTable,
          ContactosTablaData,
          $$ContactosTablaTableFilterComposer,
          $$ContactosTablaTableOrderingComposer,
          $$ContactosTablaTableAnnotationComposer,
          $$ContactosTablaTableCreateCompanionBuilder,
          $$ContactosTablaTableUpdateCompanionBuilder,
          (
            ContactosTablaData,
            BaseReferences<
              _$DriftService,
              $ContactosTablaTable,
              ContactosTablaData
            >,
          ),
          ContactosTablaData,
          PrefetchHooks Function()
        > {
  $$ContactosTablaTableTableManager(
    _$DriftService db,
    $ContactosTablaTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContactosTablaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContactosTablaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContactosTablaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
                Value<String?> foto = const Value.absent(),
                Value<String> telefono = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<bool> favorito = const Value.absent(),
              }) => ContactosTablaCompanion(
                id: id,
                nombre: nombre,
                descripcion: descripcion,
                foto: foto,
                telefono: telefono,
                email: email,
                favorito: favorito,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nombre,
                Value<String?> descripcion = const Value.absent(),
                Value<String?> foto = const Value.absent(),
                required String telefono,
                required String email,
                Value<bool> favorito = const Value.absent(),
              }) => ContactosTablaCompanion.insert(
                id: id,
                nombre: nombre,
                descripcion: descripcion,
                foto: foto,
                telefono: telefono,
                email: email,
                favorito: favorito,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ContactosTablaTableProcessedTableManager =
    ProcessedTableManager<
      _$DriftService,
      $ContactosTablaTable,
      ContactosTablaData,
      $$ContactosTablaTableFilterComposer,
      $$ContactosTablaTableOrderingComposer,
      $$ContactosTablaTableAnnotationComposer,
      $$ContactosTablaTableCreateCompanionBuilder,
      $$ContactosTablaTableUpdateCompanionBuilder,
      (
        ContactosTablaData,
        BaseReferences<
          _$DriftService,
          $ContactosTablaTable,
          ContactosTablaData
        >,
      ),
      ContactosTablaData,
      PrefetchHooks Function()
    >;

class $DriftServiceManager {
  final _$DriftService _db;
  $DriftServiceManager(this._db);
  $$ContactosTablaTableTableManager get contactosTabla =>
      $$ContactosTablaTableTableManager(_db, _db.contactosTabla);
}
