import 'package:flutter/material.dart';

import '../../core/database/drift_servise.dart';
import '../../data/datasource/grupo_local_datasource.dart';
import '../../domain/entities/grupo.dart';
import '../../domain/entities/contacto.dart';

class ContactosPorGrupoPage extends StatefulWidget {
  final Grupo grupo;

  const ContactosPorGrupoPage({super.key, required this.grupo});

  @override
  State<ContactosPorGrupoPage> createState() => _ContactosPorGrupoPageState();
}

class _ContactosPorGrupoPageState extends State<ContactosPorGrupoPage> {
  late final GrupoLocalDatasource datasource;
  Future<List<Contacto>>? _future;

  @override
  void initState() {
    super.initState();
    datasource = GrupoLocalDatasource(DriftService());
    _load();
  }

  void _load() {
    setState(() {
      _future = datasource.obtenerContactosPorGrupoCompleto(widget.grupo.id!);
    });
  }

  Future<void> _quitarContacto(Contacto contacto) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirmar'),
        content: Text('¿Quitar ${contacto.nombre} del grupo ${widget.grupo.nombre}?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
          ElevatedButton(onPressed: () => Navigator.pop(context, true), child: const Text('Quitar')),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      await datasource.quitarContactoDeGrupo(contacto.id!, widget.grupo.id!);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${contacto.nombre} fue quitado de ${widget.grupo.nombre}')),
      );
      _load();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al quitar: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grupo: ${widget.grupo.nombre}')),
      body: FutureBuilder<List<Contacto>>(
        future: _future,
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
            itemBuilder: (_, i) {
              final c = contactos[i];
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(c.nombre),
                subtitle: Text(c.telefono),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: () => _quitarContacto(c),
                  tooltip: 'Quitar del grupo',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
