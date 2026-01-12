import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/database/drift_servise.dart';
import '../../data/datasource/grupo_local_datasource.dart';
import '../../aplication/usecase/gestionar_grupos.dart';
import '../../domain/entities/grupo.dart';

final grupoProvider =
    StateNotifierProvider<GrupoNotifier, AsyncValue<List<Grupo>>>(
      (ref) => GrupoNotifier(),
    );

class GrupoNotifier extends StateNotifier<AsyncValue<List<Grupo>>> {
  GrupoNotifier() : super(const AsyncLoading()) {
    cargar();
  }

  late GestionarGrupos usecase;

  Future<void> cargar() async {
    final db = DriftService();
    usecase = GestionarGrupos(GrupoLocalDatasource(db));
    state = AsyncData(await usecase.listar());
  }

  Future<void> crear(String nombre) async {
    await usecase.crear(nombre);
    cargar();
  }
}
