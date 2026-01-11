import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/database/sqlite_servise.dart';
import '../../data/datasource/contacto_local_datasouse.dart';
import '../../data/repositories/contacto_repository_impl.dart';
import '../../aplication/usecase/gestionar_contactos.dart';
import '../../domain/entities/contacto.dart';

/*definir el provider*/
final contactoProvider = StateNotifierProvider<ContactoNotifier, AsyncValue<List<Contacto>>>(
  (ref) => ContactoNotifier(),
  
);

class ContactoNotifier extends StateNotifier<AsyncValue<List<Contacto>>>{
  ContactoNotifier() : super(AsyncLoading()){
    cargar();
  }
  late GestionarContactos usecase;

  Future<void> cargar() async {
    final db = await SQLiteService.init();
    usecase = GestionarContactos(
      ContactoRepositoryImpl(
        ContactoLocalDatasouse(db)
      ),
    );
    state = AsyncData(await usecase.listar());
  }

  Future<void> agregar(Contacto c) async {
    await usecase.agregar(c);
    cargar();
  }
}

