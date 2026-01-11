import 'package:drift/drift.dart';

class ContactosTabla extends Table{
    IntColumn get id => integer().autoIncrement()();
    TextColumn get nombre => text()();
    TextColumn get descripcion => text().nullable()();
    TextColumn get foto => text().nullable()();
    TextColumn get telefono => text()();
    TextColumn get email => text()();
    BoolColumn get favorito => boolean().withDefault(const Constant(false))();

}