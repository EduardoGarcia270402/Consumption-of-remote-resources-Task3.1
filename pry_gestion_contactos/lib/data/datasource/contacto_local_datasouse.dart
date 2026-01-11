import 'package:sqflite/sqflite.dart';
import '../../domain/entities/contacto.dart';

class ContactoLocalDatasouse {
  final Database db; // conexion a la base de datos 

  ContactoLocalDatasouse(this.db);

  //Ejecutar un Select From
  Future<List<Contacto>> obtenerContactos() async {
    final result = await db.query('contactos');

    return result.map((e) => Contacto(
        id: e['id'] as int,
        nombre: e['nombre'] as String,
        description: e['descripcion'] as String,
        foto: e['foto'] as String,
      )
    ).toList();
  }
  
  //Ejecutar un Insert Into
  Future<void> insertarContacto(Contacto c) async {
    await db.insert(
      'contactos',
      {
        'nombre': c.nombre,
        'descripcion': c.description,
        'foto': c.foto,
      }
    );
  }
}
