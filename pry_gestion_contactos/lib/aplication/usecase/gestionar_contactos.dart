import '../../domain/repositories/contacto_repository.dart';
import '../../domain/entities/contacto.dart';

class GestionarContactos {
  //instanciando
  final ContactoRepository repository;

  GestionarContactos(this.repository);

  //metodos
  Future<List<Contacto>> listar() => repository.obtenerContacto();
  Future<void> agregar(Contacto c) => repository.agregarContacto(c);
  Future<List<Contacto>> buscar(String n, bool asc) =>
      repository.buscar(n, asc);

  Future<void> cambiarFavorito(int id, bool valor)=>repository.cambiarFavorito(id, valor);
  Future<List<Contacto>> listarFavoritos()=>repository.obtenerFavoritos();
  Future<void> editar(Contacto c) => repository.editarContacto(c);
  Future<void> eliminar(int id) => repository.eliminarContacto(id);
}
