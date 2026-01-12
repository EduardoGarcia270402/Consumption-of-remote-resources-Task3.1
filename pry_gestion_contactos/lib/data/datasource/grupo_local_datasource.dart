import 'package:drift/drift.dart';

import '../../core/database/drift_servise.dart';
import '../../domain/entities/grupo.dart';

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
  // OBTENER CONTACTOS POR GRUPO
  // ===============================
  Future<List<String>> obtenerContactosPorGrupo(int grupoId) async {
    final query = db.customSelect(
      '''
      SELECT c.nombre
      FROM contactos_tabla c
      INNER JOIN contacto_grupo_tabla cg
        ON c.id = cg.contacto_id
      WHERE cg.grupo_id = ?
      ''',
      variables: [Variable<int>(grupoId)],
      readsFrom: {db.contactosTabla, db.contactoGrupoTabla},
    );

    final result = await query.get();

    return result.map((row) => row.read<String>('nombre')).toList();
  }
}
