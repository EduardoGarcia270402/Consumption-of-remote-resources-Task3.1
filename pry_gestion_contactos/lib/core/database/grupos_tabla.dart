import 'package:drift/drift.dart';

class GruposTabla extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text()();
}
