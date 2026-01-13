import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/entities/contacto.dart';
import '../../domain/entities/grupo.dart';
import '../providers/contacto_provider.dart';
import '../providers/grupo_provider.dart';
import '../../core/database/drift_servise.dart';
import '../../data/datasource/grupo_local_datasource.dart';

class ContactTile extends ConsumerWidget {
  final Contacto contacto;
  final bool mostrarFavorito;

  const ContactTile({
    super.key,
    required this.contacto,
    this.mostrarFavorito = true,
  });

  // ===============================
  // 📞 LLAMAR
  // ===============================
  Future<void> llamar(String telefono) async {
    final uri = Uri.parse('tel:$telefono');
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  // ===============================
  // ✉️ ENVIAR CORREO
  // ===============================
  Future<void> enviarCorreo(String email) async {
    final uri = Uri.parse('mailto:$email');
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  // ===============================
  // 👥 ASIGNAR CONTACTO A GRUPO
  // ===============================
  void _asignarAGrupo(BuildContext context, WidgetRef ref) {
    final gruposState = ref.read(grupoProvider);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Asignar a grupo'),
        content: gruposState.when(
          data: (List<Grupo> grupos) {
            if (grupos.isEmpty) {
              return const Text('No hay grupos creados');
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: grupos.map((g) {
                return ListTile(
                  leading: const Icon(Icons.group),
                  title: Text(g.nombre),
                  onTap: () async {
                    final db = DriftService();
                    final ds = GrupoLocalDatasource(db);
                    await ds.agregarContactoAGrupo(contacto.id!, g.id!);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Agregado a ${g.nombre}')),
                    );
                  },
                );
              }).toList(),
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (_, __) => const Text('Error cargando grupos'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
leading: Stack(
          clipBehavior: Clip.none,
          children: [
            const CircleAvatar(child: Icon(Icons.person)),
            // badge si teléfono o email inválido
            if ((contacto.telefono.replaceAll(RegExp(r'\D'), '').length < 7) ||
                !RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(contacto.email))
              Positioned(
                right: -4,
                top: -4,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.error, size: 12, color: Colors.white),
                ),
              ),
          ],
        ),
      title: Text(
        contacto.nombre,
        style: TextStyle(
          color: ((contacto.telefono.replaceAll(RegExp(r'\D'), '').length < 7) ||
                  !RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(contacto.email))
              ? Colors.red
              : null,
        ),
      ),

      // 🔹 DESCRIPCIÓN + TELÉFONO + EMAIL
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (contacto.description.isNotEmpty) Text(contacto.description),
          Text(contacto.telefono),
          Text(contacto.email),
        ],
      ),

      // ===============================
      // ✏️ TAP → EDITAR CONTACTO
      // ===============================
      onTap: () {
        final nombreCtrl = TextEditingController(text: contacto.nombre);
        final descCtrl = TextEditingController(text: contacto.description);
        final telCtrl = TextEditingController(text: contacto.telefono);
        final emailCtrl = TextEditingController(text: contacto.email);

        showDialog(
          context: context,
          builder: (_) {
            final _formKey = GlobalKey<FormState>();
            return AlertDialog(
            title: const Text('Editar contacto'),
            content: SingleChildScrollView(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: nombreCtrl,
                      decoration: const InputDecoration(labelText: 'Nombre'),
                      validator: (v) => (v == null || v.trim().isEmpty) ? 'Ingrese el nombre del contacto' : null,
                    ),
                    TextFormField(
                      controller: descCtrl,
                      decoration: const InputDecoration(labelText: 'Descripción'),
                    ),
                    TextFormField(
                      controller: telCtrl,
                      decoration: const InputDecoration(labelText: 'Teléfono'),
                      keyboardType: TextInputType.phone,
                      validator: (v) {
                        final digits = (v ?? '').replaceAll(RegExp(r'\D'), '');
                        if (digits.length < 7) return 'Teléfono inválido (mínimo 7 dígitos)';
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: emailCtrl,
                      decoration: const InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) {
                        final email = (v ?? '').trim();
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                        if (!emailRegex.hasMatch(email)) return 'Email inválido';
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (!(_formKey.currentState?.validate() ?? false)) return;

                  final nombre = nombreCtrl.text.trim();
                  final telefono = telCtrl.text.trim();
                  final email = emailCtrl.text.trim();

                  await ref
                      .read(contactoProvider.notifier)
                      .editar(
                        Contacto(
                          id: contacto.id,
                          nombre: nombre,
                          description: descCtrl.text,
                          telefono: telefono,
                          email: email,
                          foto: contacto.foto,
                          favorito: contacto.favorito,
                        ),
                      );
                  Navigator.pop(context);
                },
                child: const Text('Guardar'),
              ),
            ],
          );
          }
        );
      },

      // ===============================
      // 🗂 LONG PRESS → GRUPO / ELIMINAR
      // ===============================
      onLongPress: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Opciones'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.group_add),
                  title: const Text('Asignar a grupo'),
                  onTap: () {
                    Navigator.pop(context);
                    _asignarAGrupo(context, ref);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.red),
                  title: const Text('Eliminar'),
                  onTap: () async {
                    Navigator.pop(context);
                    try {
                      await ref
                          .read(contactoProvider.notifier)
                          .eliminar(contacto.id!);
                    } catch (e) {
                      final msg = e.toString().replaceFirst('Exception: ', '');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(msg)),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },

      // ===============================
      // 🔘 BOTONES LATERALES
      // ===============================
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () => llamar(contacto.telefono),
          ),
          IconButton(
            icon: const Icon(Icons.email),
            onPressed: () => enviarCorreo(contacto.email),
          ),
          if (mostrarFavorito)
            IconButton(
              icon: Icon(
                contacto.favorito ? Icons.star : Icons.star_border,
                color: contacto.favorito ? Colors.amber : null,
              ),
              onPressed: () {
                ref.read(contactoProvider.notifier).toggleFavorito(contacto);
              },
            ),
        ],
      ),
    );
  }
}
