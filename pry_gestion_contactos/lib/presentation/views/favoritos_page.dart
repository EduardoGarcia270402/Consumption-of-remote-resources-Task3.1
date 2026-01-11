import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pry_gestion_contactos/presentation/views/contact_tile.dart';
import '../providers/contacto_provider.dart';

class FavoritosPage extends ConsumerStatefulWidget {
  const FavoritosPage({super.key});

  @override
  ConsumerState<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends ConsumerState<FavoritosPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(contactoProvider.notifier).cargarFavoritos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final contactos = ref.watch(contactoProvider);

    return contactos.when(
      data: (list) {
        if (list.isEmpty) {
          return const Center(
            child: Text(
              '⭐ No hay contactos favoritos agregados',
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          );
        }

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, i) => ContactTile(
            contacto: list[i],
            mostrarFavorito: false,
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text(e.toString())),
    );
  }
}
