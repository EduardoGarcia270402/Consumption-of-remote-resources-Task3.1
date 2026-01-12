import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pry_gestion_contactos/core/database/drift_servise.dart';
import '../../data/datasource/contacto_local_datasouse.dart';
import '../../data/repositories/contacto_repository_impl.dart';
import '../../aplication/usecase/gestionar_contactos.dart';
import '../../domain/entities/contacto.dart';

/* definir el provider */
final contactoProvider =
    StateNotifierProvider<ContactoNotifier, AsyncValue<List<Contacto>>>(
      (ref) => ContactoNotifier(),
    );

class ContactoNotifier extends StateNotifier<AsyncValue<List<Contacto>>> {
  ContactoNotifier() : super(const AsyncLoading()) {
    cargar();
  }

  late GestionarContactos usecase;

  ///Cargar todos los contactos
  Future<void> cargar() async {
    final db = DriftService();
    usecase = GestionarContactos(
      ContactoRepositoryImpl(ContactoLocalDatasouse(db)),
    );
    state = AsyncData(await usecase.listar());
  }

  ///Agregar contacto
  Future<void> agregar(Contacto c) async {
    await usecase.agregar(c);
    cargar();
  }

  ///Buscar contactos
  Future<void> buscar(String texto, bool asc) async {
    state = AsyncData(await usecase.buscar(texto, asc));
  }

  ///Favoritos
  Future<void> toggleFavorito(Contacto c) async {
    await usecase.cambiarFavorito(c.id!, !c.favorito);
    cargar();
  }

  ///Cargar solo favoritos
  Future<void> cargarFavoritos() async {
    state = AsyncData(await usecase.listarFavoritos());
  }

  ///EDITAR contacto
  Future<void> editar(Contacto c) async {
    await usecase.editar(c);
    cargar();
  }

  ///ELIMINAR contacto
  Future<void> eliminar(int id) async {
    await usecase.eliminar(id);
    cargar();
  }
}
