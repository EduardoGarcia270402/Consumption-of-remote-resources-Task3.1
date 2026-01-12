import '../datasource/contacto_local_datasouse.dart';
import '../../domain/entities/contacto.dart';
import '../../domain/repositories/contacto_repository.dart';

class ContactoRepositoryImpl implements ContactoRepository {
  final ContactoLocalDatasouse local;

  ContactoRepositoryImpl(this.local);

  @override
  Future<List<Contacto>> obtenerContacto() => local.obtenerContactos();

  @override
  Future<void> agregarContacto(Contacto c) => local.insertarContacto(c);
  @override
  Future<List<Contacto>> buscar(String nombre, bool asc) =>
      local.buscar(nombre, asc);

  @override
  Future<void> cambiarFavorito(int id, bool valor)=> local.cambiarFavorito(id, valor);
  
  @override
  Future<List<Contacto>> obtenerFavoritos()=> local.obtenerFavoritos();
  
  @override
  Future<void> editarContacto(Contacto c) => local.actualizarContacto(c);

  @override
  Future<void> eliminarContacto(int id) => local.eliminarContacto(id);
}
