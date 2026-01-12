import '../entities/contacto.dart';

abstract class ContactoRepository {
  Future<List<Contacto>> obtenerContacto();
  Future<void> agregarContacto(Contacto contacto);
  Future<List<Contacto>> buscar(String nombre, bool asc);
  Future<void> cambiarFavorito(int id, bool valor);
  Future<List<Contacto>> obtenerFavoritos();
  Future<void> editarContacto(Contacto contacto);
  Future<void> eliminarContacto(int id);

}