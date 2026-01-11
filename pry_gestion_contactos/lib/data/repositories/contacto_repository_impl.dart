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
}