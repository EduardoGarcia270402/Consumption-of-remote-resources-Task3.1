import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pry_gestion_contactos/presentation/views/contactos_por_grupo_page.dart.dart';

import '../providers/grupo_provider.dart';
import '../../domain/entities/grupo.dart';

class GruposPage extends ConsumerWidget {
  const GruposPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final grupos = ref.watch(grupoProvider);
    final ctrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Grupos')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Nuevo Grupo'),
              content: TextField(
                controller: ctrl,
                decoration: const InputDecoration(
                  labelText: 'Nombre del grupo',
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (ctrl.text.trim().isNotEmpty) {
                      ref.read(grupoProvider.notifier).crear(ctrl.text.trim());
                    }
                    ctrl.clear();
                    Navigator.pop(context);
                  },
                  child: const Text('Guardar'),
                ),
              ],
            ),
          );
        },
      ),
      body: grupos.when(
        data: (List<Grupo> list) {
          if (list.isEmpty) {
            return const Center(
              child: Text(
                'No hay grupos creados',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, i) => ListTile(
              leading: const Icon(Icons.group),
              title: Text(list[i].nombre),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ContactosPorGrupoPage(grupo: list[i]),
                  ),
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}
