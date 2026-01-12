import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift_sqflite/drift_sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../database/contactos_tabla.dart';

part 'drift_servise.g.dart';

@DriftDatabase(tables: [ContactosTabla])
class DriftService extends _$DriftService {
  DriftService() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // ===============================
  // NUEVO: OBTENER TODOS LOS CONTACTOS
  // ===============================
  Future<List<ContactosTablaData>> obtenerContactos() {
    return select(contactosTabla).get();
  }

  // ===============================
  // NUEVO: ACTUALIZAR CONTACTO
  // ===============================
  Future<void> actualizarContacto(ContactosTablaCompanion contacto) {
    return update(contactosTabla).replace(contacto);
  }

  // ===============================
  // NUEVO: ELIMINAR CONTACTO
  // ===============================
  Future<void> eliminarContacto(int id) {
    return (delete(contactosTabla)..where((tbl) => tbl.id.equals(id))).go();
  }

  // ===============================
  // NUEVO: TOGGLE FAVORITO
  // ===============================
  Future<void> toggleFavorito(int id, bool valor) {
    return (update(contactosTabla)..where((tbl) => tbl.id.equals(id))).write(
      ContactosTablaCompanion(favorito: Value(valor)),
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
