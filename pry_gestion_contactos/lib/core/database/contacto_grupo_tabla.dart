import 'package:drift/drift.dart';
import 'contactos_tabla.dart';
import 'grupos_tabla.dart';

class ContactoGrupoTabla extends Table {
  IntColumn get contactoId => integer().references(ContactosTabla, #id)();

  IntColumn get grupoId => integer().references(GruposTabla, #id)();

  @override
  Set<Column> get primaryKey => {contactoId, grupoId};
}
