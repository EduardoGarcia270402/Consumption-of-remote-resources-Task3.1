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

  Future<void> llamar(String telefono) async {
    final uri = Uri.parse('tel:$telefono');
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> enviarCorreo(String email) async {
    final mailto = Uri.parse('mailto:$email');
    await launchUrl(mailto, mode: LaunchMode.externalApplication);
  }

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
                ref
                    .read(contactoProvider.notifier)
                    .toggleFavorito(contacto);
              },
            ),
        ],
      ),
    );
  }
}
