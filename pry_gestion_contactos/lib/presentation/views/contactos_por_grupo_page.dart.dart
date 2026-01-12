import 'package:flutter/material.dart';

import '../../core/database/drift_servise.dart';
import '../../data/datasource/grupo_local_datasource.dart';
import '../../domain/entities/grupo.dart';

class ContactosPorGrupoPage extends StatelessWidget {
  final Grupo grupo;

  const ContactosPorGrupoPage({super.key, required this.grupo});

  @override
  Widget build(BuildContext context) {
    final datasource = GrupoLocalDatasource(DriftService());

    return Scaffold(
      appBar: AppBar(title: Text('Grupo: ${grupo.nombre}')),
      body: FutureBuilder<List<String>>(
        future: datasource.obtenerContactosPorGrupo(grupo.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final contactos = snapshot.data ?? [];

          if (contactos.isEmpty) {
            return const Center(
              child: Text(
                'Este grupo no tiene contactos',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            itemCount: contactos.length,
            itemBuilder: (_, i) => ListTile(
              leading: const Icon(Icons.person),
              title: Text(contactos[i]),
            ),
          );
        },
      ),
    );
  }
}
