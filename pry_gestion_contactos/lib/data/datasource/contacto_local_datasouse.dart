import 'package:drift/drift.dart';

import '../../core/database/drift_servise.dart';
//import 'package:sqflite/sqflite.dart';
import '../../domain/entities/contacto.dart';

class ContactoLocalDatasouse {
  final DriftService db;

  ContactoLocalDatasouse(this.db);

  // Obtener todos
  Future<List<Contacto>> obtenerContactos() async {
    final result = await db.select(db.contactosTabla).get();

    return result
        .map(
          (c) => Contacto(
            id: c.id,
            nombre: c.nombre,
            description: c.descripcion ?? '',
            foto: c.foto ?? '',
            telefono: c.telefono,
            email: c.email,
            favorito: c.favorito,
          ),
        )
        .toList();
  }

  // Insertar
  Future<void> insertarContacto(Contacto c) async {
    await db
        .into(db.contactosTabla)
        .insert(
          ContactosTablaCompanion.insert(
            nombre: c.nombre,
            descripcion: Value(c.description),
            foto: Value(c.foto),
            telefono: c.telefono,
            email: c.email,
          ),
        );
  }

  // Buscar + ordenar
  Future<List<Contacto>> buscar(String nombre, bool asc) async {
    final query = db.select(db.contactosTabla)
      ..where((t) => t.nombre.like('%$nombre%'))
      ..orderBy([
        (t) => OrderingTerm(
          expression: t.nombre,
          mode: asc ? OrderingMode.asc : OrderingMode.desc,
        ),
      ]);

    final result = await query.get();

    return result
        .map(
          (c) => Contacto(
            id: c.id,
            nombre: c.nombre,
            description: c.descripcion ?? '',
            foto: c.foto ?? '',
            telefono: c.telefono,
            email: c.email,
            favorito: c.favorito,
          ),
        )
        .toList();
  }

  //Favoritos y listar
  Future<void> cambiarFavorito(int id, bool valor) async {
    await (db.update(db.contactosTabla)
          ..where((c) => c.id.equals(id)))
        .write(ContactosTablaCompanion(favorito: Value(valor)));
  }

  Future<List<Contacto>> obtenerFavoritos() async {
    final result =
        await (db.select(db.contactosTabla)..where((c) => c.favorito.equals(true)))
            .get();

        return result.map((c) => Contacto(
        id: c.id,
        nombre: c.nombre,
        description: c.descripcion ?? '',
        foto: c.foto ?? '',
        telefono: c.telefono,
        email: c.email,
        favorito: c.favorito,
      )).toList();
  }

  // Actualizar contacto
  Future<void> actualizarContacto(Contacto c) async {
    if (c.id == null) return;

    await (db.update(db.contactosTabla)
          ..where((t) => t.id.equals(c.id!)))
        .write(ContactosTablaCompanion(
      nombre: Value(c.nombre),
      descripcion: Value(c.description),
      foto: Value(c.foto),
      telefono: Value(c.telefono),
      email: Value(c.email),
      favorito: Value(c.favorito),
    ));
  }

  // Eliminar contacto
  Future<void> eliminarContacto(int id) async {
    await (db.delete(db.contactosTabla)..where((t) => t.id.equals(id))).go();
  }

  // EDITAR
  Future<void> editarContacto(Contacto c) async {
    await (db.update(
      db.contactosTabla,
    )..where((t) => t.id.equals(c.id!))).write(
      ContactosTablaCompanion(
        nombre: Value(c.nombre),
        descripcion: Value(c.description),
        foto: Value(c.foto),
        telefono: Value(c.telefono),
        email: Value(c.email),
      ),
    );
  }

  /*
  final Database db; // conexion a la base de datos

  ContactoLocalDatasouse(this.db);

  //Ejecutar un Select From
  Future<List<Contacto>> obtenerContactos() async {
    final result = await db.query('contactos');

    return result
        .map(
          (e) => Contacto(
            id: e['id'] as int,
            nombre: e['nombre'] as String,
            description: e['descripcion'] as String,
            foto: e['foto'] as String,
            telefono: e['telefono'] as String,
            email: e['email'] as String,
          ),
        )
        .toList();
  }

  //Ejecutar un Insert Into
  Future<void> insertarContacto(Contacto c) async {
    await db.insert('contactos', {
      'nombre': c.nombre,
      'descripcion': c.description,
      'foto': c.foto,
      'telefono': c.telefono,
      'email': c.email,
    });
  }
  */
}
