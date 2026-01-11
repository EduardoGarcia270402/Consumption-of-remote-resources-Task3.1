import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pry_gestion_contactos/core/database/drift_servise.dart';
//import '../../core/database/sqlite_servise.dart';
import '../../data/datasource/contacto_local_datasouse.dart';
import '../../data/repositories/contacto_repository_impl.dart';
import '../../aplication/usecase/gestionar_contactos.dart';
import '../../domain/entities/contacto.dart';

/*definir el provider*/
final contactoProvider =
    StateNotifierProvider<ContactoNotifier, AsyncValue<List<Contacto>>>(
      (ref) => ContactoNotifier(),
    );

class ContactoNotifier extends StateNotifier<AsyncValue<List<Contacto>>> {
  ContactoNotifier() : super(AsyncLoading()) {
    cargar();
  }
  late GestionarContactos usecase;

  Future<void> cargar() async {
    final db = DriftService();
    usecase = GestionarContactos(
      ContactoRepositoryImpl(ContactoLocalDatasouse(db)),
    );
    state = AsyncData(await usecase.listar());
  }

  Future<void> agregar(Contacto c) async {
    await usecase.agregar(c);
    cargar();
  }

  Future<void> buscar(String texto, bool asc) async {
    state = AsyncData(await usecase.buscar(texto, asc));
  }

  Future<void> toggleFavorito(Contacto c) async {
    await usecase.cambiarFavorito(c.id!, !c.favorito);
    cargar();
  }

  Future<void> cargarFavoritos() async {
    state = AsyncData(await usecase.listarFavoritos());
  }
}
