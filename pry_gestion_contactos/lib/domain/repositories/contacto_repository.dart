import '../entities/contacto.dart';

abstract class ContactoRepository {
  Future<List<Contacto>> obtenerContacto();
  Future<void> agregarContacto(Contacto contacto);
  Future<List<Contacto>> buscar(String nombre, bool asc);
}