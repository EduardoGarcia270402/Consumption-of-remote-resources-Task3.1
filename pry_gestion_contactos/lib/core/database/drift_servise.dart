import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift_sqflite/drift_sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../database/contactos_tabla.dart';
import '../database/grupos_tabla.dart';
import '../database/contacto_grupo_tabla.dart';

part 'drift_servise.g.dart';

@DriftDatabase(tables: [ContactosTabla, GruposTabla, ContactoGrupoTabla])
class DriftService extends _$DriftService {
  DriftService() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  // ===============================
  // CONTACTOS
  // ===============================
  Future<List<ContactosTablaData>> obtenerContactos() {
    return select(contactosTabla).get();
  }

  Future<void> actualizarContacto(ContactosTablaCompanion contacto) {
    return update(contactosTabla).replace(contacto);
  }

  Future<void> eliminarContacto(int id) {
    return (delete(contactosTabla)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> toggleFavorito(int id, bool valor) {
    return (update(contactosTabla)..where((tbl) => tbl.id.equals(id))).write(
      ContactosTablaCompanion(favorito: Value(valor)),
    );
  }

  // ===============================
  // GRUPOS
  // ===============================
  Future<List<GruposTablaData>> obtenerGrupos() {
    return select(gruposTabla).get();
  }

  Future<void> insertarGrupo(String nombre) {
    return into(
      gruposTabla,
    ).insert(GruposTablaCompanion.insert(nombre: nombre));
  }

  Future<void> agregarContactoAGrupo(int contactoId, int grupoId) {
    return into(contactoGrupoTabla).insert(
      ContactoGrupoTablaCompanion.insert(
        contactoId: contactoId,
        grupoId: grupoId,
      ),
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'contactos.db'));
    return SqfliteQueryExecutor(path: file.path);
  });
}
