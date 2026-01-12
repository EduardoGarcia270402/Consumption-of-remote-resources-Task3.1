import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/contacto.dart';
import '../providers/contacto_provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final mailto = Uri.parse('mailto:$email');
    await launchUrl(mailto, mode: LaunchMode.externalApplication);
  }

  // ===============================
  // ✏️ DIÁLOGO EDITAR
  // ===============================
  void _mostrarDialogoEditar(
    BuildContext context,
    WidgetRef ref,
    Contacto contacto,
  ) {
    final nombreCtrl = TextEditingController(text: contacto.nombre);
    final descCtrl = TextEditingController(text: contacto.description);
    final telCtrl = TextEditingController(text: contacto.telefono);
    final emailCtrl = TextEditingController(text: contacto.email);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Editar contacto'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nombreCtrl,
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: descCtrl,
                decoration: const InputDecoration(labelText: 'Descripción'),
              ),
              TextField(
                controller: telCtrl,
                decoration: const InputDecoration(labelText: 'Teléfono'),
              ),
              TextField(
                controller: emailCtrl,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(contactoProvider.notifier)
                  .editar(
                    Contacto(
                      id: contacto.id,
                      nombre: nombreCtrl.text,
                      description: descCtrl.text,
                      telefono: telCtrl.text,
                      email: emailCtrl.text,
                      foto: contacto.foto,
                      favorito: contacto.favorito,
                    ),
                  );
              Navigator.pop(context);
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }

  // ===============================
  // 🗑️ CONFIRMAR ELIMINAR
  // ===============================
  void _confirmarEliminar(BuildContext context, WidgetRef ref, int id) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Eliminar contacto'),
        content: const Text('¿Seguro que deseas eliminar este contacto?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              ref.read(contactoProvider.notifier).eliminar(id);
              Navigator.pop(context);
            },
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  // ===============================
  // UI
  // ===============================
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(contacto.nombre),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(contacto.description),
          Text(contacto.telefono),
          Text(contacto.email),
        ],
      ),
      onTap: () {
        final nombreCtrl = TextEditingController(text: contacto.nombre);
        final descripcionCtrl = TextEditingController(text: contacto.description);
        final telefonoCtrl = TextEditingController(text: contacto.telefono);
        final emailCtrl = TextEditingController(text: contacto.email);

        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Editar Contacto'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(controller: nombreCtrl, decoration: const InputDecoration(labelText: 'Nombre')),
                  TextField(controller: descripcionCtrl, decoration: const InputDecoration(labelText: 'Descripción')),
                  TextField(controller: telefonoCtrl, decoration: const InputDecoration(labelText: 'Teléfono'), keyboardType: TextInputType.phone),
                  TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: 'Email'), keyboardType: TextInputType.emailAddress),
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Eliminar Contacto'),
                      content: const Text('¿Estás seguro de que deseas eliminar este contacto?'),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
                        ElevatedButton(
                          onPressed: () async {
                            await ref.read(contactoProvider.notifier).eliminar(contacto.id!);
                            Navigator.pop(context); // close confirm
                            Navigator.pop(context); // close edit dialog
                          },
                          child: const Text('Eliminar'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
              ),
              ElevatedButton(
                onPressed: () async {
                  await ref.read(contactoProvider.notifier).editar(
                    Contacto(
                      id: contacto.id,
                      nombre: nombreCtrl.text,
                      description: descripcionCtrl.text,
                      foto: contacto.foto,
                      telefono: telefonoCtrl.text,
                      email: emailCtrl.text,
                      favorito: contacto.favorito,
                    ),
                  );
                  Navigator.pop(context);
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
        );
      },
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 📞 Llamar
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () => llamar(contacto.telefono),
          ),

          // ✉️ Email
          IconButton(
            icon: const Icon(Icons.email),
            onPressed: () => enviarCorreo(contacto.email),
          ),

          // ⭐ Favorito
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

          // ✏️ Editar
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              _mostrarDialogoEditar(context, ref, contacto);
            },
          ),

          // 🗑️ Eliminar
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _confirmarEliminar(context, ref, contacto.id!);
            },
          ),
        ],
      ),
    );
  }
}
