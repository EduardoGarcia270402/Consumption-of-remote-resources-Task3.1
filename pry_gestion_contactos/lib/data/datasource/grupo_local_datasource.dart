import 'package:drift/drift.dart';

import '../../core/database/drift_servise.dart';
import '../../domain/entities/grupo.dart';
import '../../domain/entities/contacto.dart';

class GrupoLocalDatasource {
  final DriftService db;

  GrupoLocalDatasource(this.db);

  // ===============================
  // OBTENER GRUPOS
  // ===============================
  Future<List<Grupo>> obtenerGrupos() async {
    final result = await db.select(db.gruposTabla).get();

    return result.map((g) => Grupo(id: g.id, nombre: g.nombre)).toList();
  }

  // ===============================
  // INSERTAR GRUPO
  // ===============================
  Future<void> insertarGrupo(String nombre) async {
    await db
        .into(db.gruposTabla)
        .insert(GruposTablaCompanion.insert(nombre: nombre));
  }

  // ===============================
  // AGREGAR CONTACTO A GRUPO
  // ===============================
  Future<void> agregarContactoAGrupo(int contactoId, int grupoId) async {
    await db
        .into(db.contactoGrupoTabla)
        .insert(
          ContactoGrupoTablaCompanion.insert(
            contactoId: contactoId,
            grupoId: grupoId,
          ),
        );
  }

  // ===============================
  // OBTENER CONTACTOS POR GRUPO (COMPLETO)
  // ===============================
  Future<List<Contacto>> obtenerContactosPorGrupoCompleto(int grupoId) async {
    final query = db.customSelect(
      '''
      SELECT c.*
      FROM contactos_tabla c
      INNER JOIN contacto_grupo_tabla cg
        ON c.id = cg.contacto_id
      WHERE cg.grupo_id = ?
      ''',
      variables: [Variable<int>(grupoId)],
      readsFrom: {db.contactosTabla, db.contactoGrupoTabla},
    );

    final result = await query.get();

    return result.map((row) {
      // algunos campos pueden ser null en la BD, así que proveemos valores por defecto
      return Contacto(
        id: row.read<int>('id'),
        nombre: row.read<String>('nombre'),
        description: row.read<String?>('descripcion') ?? '',
        foto: row.read<String?>('foto') ?? '',
        telefono: row.read<String?>('telefono') ?? '',
        email: row.read<String?>('email') ?? '',
        favorito: row.read<bool?>('favorito') ?? false,
      );
    }).toList();
  }

  // ===============================
  // QUITAR CONTACTO DE UN GRUPO
  // ===============================
  Future<void> quitarContactoDeGrupo(int contactoId, int grupoId) async {
    await (db.delete(db.contactoGrupoTabla)
          ..where((t) => t.contactoId.equals(contactoId) & t.grupoId.equals(grupoId)))
        .go();
  }
}
