import '../../domain/repositories/contacto_repository.dart';
import '../../domain/entities/contacto.dart';

class GestionarContactos {
  //instanciando
  final ContactoRepository repository;

  GestionarContactos(this.repository);

  //metodos
  Future<List<Contacto>> listar () => repository.obtenerContacto();
  Future<void> agregar(Contacto c) => repository.agregarContacto(c);
}