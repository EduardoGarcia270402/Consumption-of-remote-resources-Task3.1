import '../../domain/entities/grupo.dart';
import '../../data/datasource/grupo_local_datasource.dart';

class GestionarGrupos {
  final GrupoLocalDatasource datasource;

  GestionarGrupos(this.datasource);

  Future<List<Grupo>> listar() => datasource.obtenerGrupos();
  Future<void> crear(String nombre) => datasource.insertarGrupo(nombre);
  Future<void> agregarContacto(int contactoId, int grupoId) =>
      datasource.agregarContactoAGrupo(contactoId, grupoId);
}
