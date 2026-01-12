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

class $GruposTablaTable extends GruposTabla
    with TableInfo<$GruposTablaTable, GruposTablaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GruposTablaTable(this.attachedDatabase, [this._alias]);
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
  @override
  List<GeneratedColumn> get $columns => [id, nombre];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'grupos_tabla';
  @override
  VerificationContext validateIntegrity(
    Insertable<GruposTablaData> instance, {
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GruposTablaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GruposTablaData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
    );
  }

  @override
  $GruposTablaTable createAlias(String alias) {
    return $GruposTablaTable(attachedDatabase, alias);
  }
}

class GruposTablaData extends DataClass implements Insertable<GruposTablaData> {
  final int id;
  final String nombre;
  const GruposTablaData({required this.id, required this.nombre});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre'] = Variable<String>(nombre);
    return map;
  }

  GruposTablaCompanion toCompanion(bool nullToAbsent) {
    return GruposTablaCompanion(id: Value(id), nombre: Value(nombre));
  }

  factory GruposTablaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GruposTablaData(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String>(nombre),
    };
  }

  GruposTablaData copyWith({int? id, String? nombre}) =>
      GruposTablaData(id: id ?? this.id, nombre: nombre ?? this.nombre);
  GruposTablaData copyWithCompanion(GruposTablaCompanion data) {
    return GruposTablaData(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GruposTablaData(')
          ..write('id: $id, ')
          ..write('nombre: $nombre')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nombre);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GruposTablaData &&
          other.id == this.id &&
          other.nombre == this.nombre);
}

class GruposTablaCompanion extends UpdateCompanion<GruposTablaData> {
  final Value<int> id;
  final Value<String> nombre;
  const GruposTablaCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
  });
  GruposTablaCompanion.insert({
    this.id = const Value.absent(),
    required String nombre,
  }) : nombre = Value(nombre);
  static Insertable<GruposTablaData> custom({
    Expression<int>? id,
    Expression<String>? nombre,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
    });
  }

  GruposTablaCompanion copyWith({Value<int>? id, Value<String>? nombre}) {
    return GruposTablaCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GruposTablaCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre')
          ..write(')'))
        .toString();
  }
}

class $ContactoGrupoTablaTable extends ContactoGrupoTabla
    with TableInfo<$ContactoGrupoTablaTable, ContactoGrupoTablaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContactoGrupoTablaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _contactoIdMeta = const VerificationMeta(
    'contactoId',
  );
  @override
  late final GeneratedColumn<int> contactoId = GeneratedColumn<int>(
    'contacto_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES contactos_tabla (id)',
    ),
  );
  static const VerificationMeta _grupoIdMeta = const VerificationMeta(
    'grupoId',
  );
  @override
  late final GeneratedColumn<int> grupoId = GeneratedColumn<int>(
    'grupo_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES grupos_tabla (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [contactoId, grupoId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'contacto_grupo_tabla';
  @override
  VerificationContext validateIntegrity(
    Insertable<ContactoGrupoTablaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('contacto_id')) {
      context.handle(
        _contactoIdMeta,
        contactoId.isAcceptableOrUnknown(data['contacto_id']!, _contactoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_contactoIdMeta);
    }
    if (data.containsKey('grupo_id')) {
      context.handle(
        _grupoIdMeta,
        grupoId.isAcceptableOrUnknown(data['grupo_id']!, _grupoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_grupoIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {contactoId, grupoId};
  @override
  ContactoGrupoTablaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContactoGrupoTablaData(
      contactoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}contacto_id'],
      )!,
      grupoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}grupo_id'],
      )!,
    );
  }

  @override
  $ContactoGrupoTablaTable createAlias(String alias) {
    return $ContactoGrupoTablaTable(attachedDatabase, alias);
  }
}

class ContactoGrupoTablaData extends DataClass
    implements Insertable<ContactoGrupoTablaData> {
  final int contactoId;
  final int grupoId;
  const ContactoGrupoTablaData({
    required this.contactoId,
    required this.grupoId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['contacto_id'] = Variable<int>(contactoId);
    map['grupo_id'] = Variable<int>(grupoId);
    return map;
  }

  ContactoGrupoTablaCompanion toCompanion(bool nullToAbsent) {
    return ContactoGrupoTablaCompanion(
      contactoId: Value(contactoId),
      grupoId: Value(grupoId),
    );
  }

  factory ContactoGrupoTablaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContactoGrupoTablaData(
      contactoId: serializer.fromJson<int>(json['contactoId']),
      grupoId: serializer.fromJson<int>(json['grupoId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'contactoId': serializer.toJson<int>(contactoId),
      'grupoId': serializer.toJson<int>(grupoId),
    };
  }

  ContactoGrupoTablaData copyWith({int? contactoId, int? grupoId}) =>
      ContactoGrupoTablaData(
        contactoId: contactoId ?? this.contactoId,
        grupoId: grupoId ?? this.grupoId,
      );
  ContactoGrupoTablaData copyWithCompanion(ContactoGrupoTablaCompanion data) {
    return ContactoGrupoTablaData(
      contactoId: data.contactoId.present
          ? data.contactoId.value
          : this.contactoId,
      grupoId: data.grupoId.present ? data.grupoId.value : this.grupoId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContactoGrupoTablaData(')
          ..write('contactoId: $contactoId, ')
          ..write('grupoId: $grupoId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(contactoId, grupoId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContactoGrupoTablaData &&
          other.contactoId == this.contactoId &&
          other.grupoId == this.grupoId);
}

class ContactoGrupoTablaCompanion
    extends UpdateCompanion<ContactoGrupoTablaData> {
  final Value<int> contactoId;
  final Value<int> grupoId;
  final Value<int> rowid;
  const ContactoGrupoTablaCompanion({
    this.contactoId = const Value.absent(),
    this.grupoId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ContactoGrupoTablaCompanion.insert({
    required int contactoId,
    required int grupoId,
    this.rowid = const Value.absent(),
  }) : contactoId = Value(contactoId),
       grupoId = Value(grupoId);
  static Insertable<ContactoGrupoTablaData> custom({
    Expression<int>? contactoId,
    Expression<int>? grupoId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (contactoId != null) 'contacto_id': contactoId,
      if (grupoId != null) 'grupo_id': grupoId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ContactoGrupoTablaCompanion copyWith({
    Value<int>? contactoId,
    Value<int>? grupoId,
    Value<int>? rowid,
  }) {
    return ContactoGrupoTablaCompanion(
      contactoId: contactoId ?? this.contactoId,
      grupoId: grupoId ?? this.grupoId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (contactoId.present) {
      map['contacto_id'] = Variable<int>(contactoId.value);
    }
    if (grupoId.present) {
      map['grupo_id'] = Variable<int>(grupoId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContactoGrupoTablaCompanion(')
          ..write('contactoId: $contactoId, ')
          ..write('grupoId: $grupoId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftService extends GeneratedDatabase {
  _$DriftService(QueryExecutor e) : super(e);
  $DriftServiceManager get managers => $DriftServiceManager(this);
  late final $ContactosTablaTable contactosTabla = $ContactosTablaTable(this);
  late final $GruposTablaTable gruposTabla = $GruposTablaTable(this);
  late final $ContactoGrupoTablaTable contactoGrupoTabla =
      $ContactoGrupoTablaTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    contactosTabla,
    gruposTabla,
    contactoGrupoTabla,
  ];
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

final class $$ContactosTablaTableReferences
    extends
        BaseReferences<
          _$DriftService,
          $ContactosTablaTable,
          ContactosTablaData
        > {
  $$ContactosTablaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $ContactoGrupoTablaTable,
    List<ContactoGrupoTablaData>
  >
  _contactoGrupoTablaRefsTable(_$DriftService db) =>
      MultiTypedResultKey.fromTable(
        db.contactoGrupoTabla,
        aliasName: $_aliasNameGenerator(
          db.contactosTabla.id,
          db.contactoGrupoTabla.contactoId,
        ),
      );

  $$ContactoGrupoTablaTableProcessedTableManager get contactoGrupoTablaRefs {
    final manager = $$ContactoGrupoTablaTableTableManager(
      $_db,
      $_db.contactoGrupoTabla,
    ).filter((f) => f.contactoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _contactoGrupoTablaRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  Expression<bool> contactoGrupoTablaRefs(
    Expression<bool> Function($$ContactoGrupoTablaTableFilterComposer f) f,
  ) {
    final $$ContactoGrupoTablaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.contactoGrupoTabla,
      getReferencedColumn: (t) => t.contactoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContactoGrupoTablaTableFilterComposer(
            $db: $db,
            $table: $db.contactoGrupoTabla,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  Expression<T> contactoGrupoTablaRefs<T extends Object>(
    Expression<T> Function($$ContactoGrupoTablaTableAnnotationComposer a) f,
  ) {
    final $$ContactoGrupoTablaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.contactoGrupoTabla,
          getReferencedColumn: (t) => t.contactoId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ContactoGrupoTablaTableAnnotationComposer(
                $db: $db,
                $table: $db.contactoGrupoTabla,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
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
          (ContactosTablaData, $$ContactosTablaTableReferences),
          ContactosTablaData,
          PrefetchHooks Function({bool contactoGrupoTablaRefs})
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
              .map(
                (e) => (
                  e.readTable(table),
                  $$ContactosTablaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({contactoGrupoTablaRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (contactoGrupoTablaRefs) db.contactoGrupoTabla,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (contactoGrupoTablaRefs)
                    await $_getPrefetchedData<
                      ContactosTablaData,
                      $ContactosTablaTable,
                      ContactoGrupoTablaData
                    >(
                      currentTable: table,
                      referencedTable: $$ContactosTablaTableReferences
                          ._contactoGrupoTablaRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ContactosTablaTableReferences(
                            db,
                            table,
                            p0,
                          ).contactoGrupoTablaRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.contactoId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
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
      (ContactosTablaData, $$ContactosTablaTableReferences),
      ContactosTablaData,
      PrefetchHooks Function({bool contactoGrupoTablaRefs})
    >;
typedef $$GruposTablaTableCreateCompanionBuilder =
    GruposTablaCompanion Function({Value<int> id, required String nombre});
typedef $$GruposTablaTableUpdateCompanionBuilder =
    GruposTablaCompanion Function({Value<int> id, Value<String> nombre});

final class $$GruposTablaTableReferences
    extends BaseReferences<_$DriftService, $GruposTablaTable, GruposTablaData> {
  $$GruposTablaTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $ContactoGrupoTablaTable,
    List<ContactoGrupoTablaData>
  >
  _contactoGrupoTablaRefsTable(_$DriftService db) =>
      MultiTypedResultKey.fromTable(
        db.contactoGrupoTabla,
        aliasName: $_aliasNameGenerator(
          db.gruposTabla.id,
          db.contactoGrupoTabla.grupoId,
        ),
      );

  $$ContactoGrupoTablaTableProcessedTableManager get contactoGrupoTablaRefs {
    final manager = $$ContactoGrupoTablaTableTableManager(
      $_db,
      $_db.contactoGrupoTabla,
    ).filter((f) => f.grupoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _contactoGrupoTablaRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GruposTablaTableFilterComposer
    extends Composer<_$DriftService, $GruposTablaTable> {
  $$GruposTablaTableFilterComposer({
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

  Expression<bool> contactoGrupoTablaRefs(
    Expression<bool> Function($$ContactoGrupoTablaTableFilterComposer f) f,
  ) {
    final $$ContactoGrupoTablaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.contactoGrupoTabla,
      getReferencedColumn: (t) => t.grupoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContactoGrupoTablaTableFilterComposer(
            $db: $db,
            $table: $db.contactoGrupoTabla,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GruposTablaTableOrderingComposer
    extends Composer<_$DriftService, $GruposTablaTable> {
  $$GruposTablaTableOrderingComposer({
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
}

class $$GruposTablaTableAnnotationComposer
    extends Composer<_$DriftService, $GruposTablaTable> {
  $$GruposTablaTableAnnotationComposer({
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

  Expression<T> contactoGrupoTablaRefs<T extends Object>(
    Expression<T> Function($$ContactoGrupoTablaTableAnnotationComposer a) f,
  ) {
    final $$ContactoGrupoTablaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.contactoGrupoTabla,
          getReferencedColumn: (t) => t.grupoId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ContactoGrupoTablaTableAnnotationComposer(
                $db: $db,
                $table: $db.contactoGrupoTabla,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$GruposTablaTableTableManager
    extends
        RootTableManager<
          _$DriftService,
          $GruposTablaTable,
          GruposTablaData,
          $$GruposTablaTableFilterComposer,
          $$GruposTablaTableOrderingComposer,
          $$GruposTablaTableAnnotationComposer,
          $$GruposTablaTableCreateCompanionBuilder,
          $$GruposTablaTableUpdateCompanionBuilder,
          (GruposTablaData, $$GruposTablaTableReferences),
          GruposTablaData,
          PrefetchHooks Function({bool contactoGrupoTablaRefs})
        > {
  $$GruposTablaTableTableManager(_$DriftService db, $GruposTablaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GruposTablaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GruposTablaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GruposTablaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nombre = const Value.absent(),
              }) => GruposTablaCompanion(id: id, nombre: nombre),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nombre,
              }) => GruposTablaCompanion.insert(id: id, nombre: nombre),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GruposTablaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({contactoGrupoTablaRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (contactoGrupoTablaRefs) db.contactoGrupoTabla,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (contactoGrupoTablaRefs)
                    await $_getPrefetchedData<
                      GruposTablaData,
                      $GruposTablaTable,
                      ContactoGrupoTablaData
                    >(
                      currentTable: table,
                      referencedTable: $$GruposTablaTableReferences
                          ._contactoGrupoTablaRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$GruposTablaTableReferences(
                            db,
                            table,
                            p0,
                          ).contactoGrupoTablaRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.grupoId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$GruposTablaTableProcessedTableManager =
    ProcessedTableManager<
      _$DriftService,
      $GruposTablaTable,
      GruposTablaData,
      $$GruposTablaTableFilterComposer,
      $$GruposTablaTableOrderingComposer,
      $$GruposTablaTableAnnotationComposer,
      $$GruposTablaTableCreateCompanionBuilder,
      $$GruposTablaTableUpdateCompanionBuilder,
      (GruposTablaData, $$GruposTablaTableReferences),
      GruposTablaData,
      PrefetchHooks Function({bool contactoGrupoTablaRefs})
    >;
typedef $$ContactoGrupoTablaTableCreateCompanionBuilder =
    ContactoGrupoTablaCompanion Function({
      required int contactoId,
      required int grupoId,
      Value<int> rowid,
    });
typedef $$ContactoGrupoTablaTableUpdateCompanionBuilder =
    ContactoGrupoTablaCompanion Function({
      Value<int> contactoId,
      Value<int> grupoId,
      Value<int> rowid,
    });

final class $$ContactoGrupoTablaTableReferences
    extends
        BaseReferences<
          _$DriftService,
          $ContactoGrupoTablaTable,
          ContactoGrupoTablaData
        > {
  $$ContactoGrupoTablaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ContactosTablaTable _contactoIdTable(_$DriftService db) =>
      db.contactosTabla.createAlias(
        $_aliasNameGenerator(
          db.contactoGrupoTabla.contactoId,
          db.contactosTabla.id,
        ),
      );

  $$ContactosTablaTableProcessedTableManager get contactoId {
    final $_column = $_itemColumn<int>('contacto_id')!;

    final manager = $$ContactosTablaTableTableManager(
      $_db,
      $_db.contactosTabla,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_contactoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $GruposTablaTable _grupoIdTable(_$DriftService db) =>
      db.gruposTabla.createAlias(
        $_aliasNameGenerator(db.contactoGrupoTabla.grupoId, db.gruposTabla.id),
      );

  $$GruposTablaTableProcessedTableManager get grupoId {
    final $_column = $_itemColumn<int>('grupo_id')!;

    final manager = $$GruposTablaTableTableManager(
      $_db,
      $_db.gruposTabla,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_grupoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ContactoGrupoTablaTableFilterComposer
    extends Composer<_$DriftService, $ContactoGrupoTablaTable> {
  $$ContactoGrupoTablaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ContactosTablaTableFilterComposer get contactoId {
    final $$ContactosTablaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.contactoId,
      referencedTable: $db.contactosTabla,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContactosTablaTableFilterComposer(
            $db: $db,
            $table: $db.contactosTabla,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GruposTablaTableFilterComposer get grupoId {
    final $$GruposTablaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.grupoId,
      referencedTable: $db.gruposTabla,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GruposTablaTableFilterComposer(
            $db: $db,
            $table: $db.gruposTabla,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ContactoGrupoTablaTableOrderingComposer
    extends Composer<_$DriftService, $ContactoGrupoTablaTable> {
  $$ContactoGrupoTablaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ContactosTablaTableOrderingComposer get contactoId {
    final $$ContactosTablaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.contactoId,
      referencedTable: $db.contactosTabla,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContactosTablaTableOrderingComposer(
            $db: $db,
            $table: $db.contactosTabla,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GruposTablaTableOrderingComposer get grupoId {
    final $$GruposTablaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.grupoId,
      referencedTable: $db.gruposTabla,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GruposTablaTableOrderingComposer(
            $db: $db,
            $table: $db.gruposTabla,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ContactoGrupoTablaTableAnnotationComposer
    extends Composer<_$DriftService, $ContactoGrupoTablaTable> {
  $$ContactoGrupoTablaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ContactosTablaTableAnnotationComposer get contactoId {
    final $$ContactosTablaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.contactoId,
      referencedTable: $db.contactosTabla,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContactosTablaTableAnnotationComposer(
            $db: $db,
            $table: $db.contactosTabla,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GruposTablaTableAnnotationComposer get grupoId {
    final $$GruposTablaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.grupoId,
      referencedTable: $db.gruposTabla,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GruposTablaTableAnnotationComposer(
            $db: $db,
            $table: $db.gruposTabla,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ContactoGrupoTablaTableTableManager
    extends
        RootTableManager<
          _$DriftService,
          $ContactoGrupoTablaTable,
          ContactoGrupoTablaData,
          $$ContactoGrupoTablaTableFilterComposer,
          $$ContactoGrupoTablaTableOrderingComposer,
          $$ContactoGrupoTablaTableAnnotationComposer,
          $$ContactoGrupoTablaTableCreateCompanionBuilder,
          $$ContactoGrupoTablaTableUpdateCompanionBuilder,
          (ContactoGrupoTablaData, $$ContactoGrupoTablaTableReferences),
          ContactoGrupoTablaData,
          PrefetchHooks Function({bool contactoId, bool grupoId})
        > {
  $$ContactoGrupoTablaTableTableManager(
    _$DriftService db,
    $ContactoGrupoTablaTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContactoGrupoTablaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContactoGrupoTablaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContactoGrupoTablaTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> contactoId = const Value.absent(),
                Value<int> grupoId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ContactoGrupoTablaCompanion(
                contactoId: contactoId,
                grupoId: grupoId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int contactoId,
                required int grupoId,
                Value<int> rowid = const Value.absent(),
              }) => ContactoGrupoTablaCompanion.insert(
                contactoId: contactoId,
                grupoId: grupoId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ContactoGrupoTablaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({contactoId = false, grupoId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
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
                    if (contactoId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.contactoId,
                                referencedTable:
                                    $$ContactoGrupoTablaTableReferences
                                        ._contactoIdTable(db),
                                referencedColumn:
                                    $$ContactoGrupoTablaTableReferences
                                        ._contactoIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (grupoId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.grupoId,
                                referencedTable:
                                    $$ContactoGrupoTablaTableReferences
                                        ._grupoIdTable(db),
                                referencedColumn:
                                    $$ContactoGrupoTablaTableReferences
                                        ._grupoIdTable(db)
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

typedef $$ContactoGrupoTablaTableProcessedTableManager =
    ProcessedTableManager<
      _$DriftService,
      $ContactoGrupoTablaTable,
      ContactoGrupoTablaData,
      $$ContactoGrupoTablaTableFilterComposer,
      $$ContactoGrupoTablaTableOrderingComposer,
      $$ContactoGrupoTablaTableAnnotationComposer,
      $$ContactoGrupoTablaTableCreateCompanionBuilder,
      $$ContactoGrupoTablaTableUpdateCompanionBuilder,
      (ContactoGrupoTablaData, $$ContactoGrupoTablaTableReferences),
      ContactoGrupoTablaData,
      PrefetchHooks Function({bool contactoId, bool grupoId})
    >;

class $DriftServiceManager {
  final _$DriftService _db;
  $DriftServiceManager(this._db);
  $$ContactosTablaTableTableManager get contactosTabla =>
      $$ContactosTablaTableTableManager(_db, _db.contactosTabla);
  $$GruposTablaTableTableManager get gruposTabla =>
      $$GruposTablaTableTableManager(_db, _db.gruposTabla);
  $$ContactoGrupoTablaTableTableManager get contactoGrupoTabla =>
      $$ContactoGrupoTablaTableTableManager(_db, _db.contactoGrupoTabla);
}
