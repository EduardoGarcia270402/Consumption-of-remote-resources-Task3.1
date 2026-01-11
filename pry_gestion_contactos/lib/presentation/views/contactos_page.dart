import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/contacto_provider.dart';
import '../../domain/entities/contacto.dart';

class ContactosPage extends ConsumerWidget {
  const ContactosPage({super.key});

  // ===============================
  // NUEVO: funciones de UI (presentation)
  // ===============================

  Future<void> llamar(String telefono) async {
    final uri = Uri.parse('tel:$telefono');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> enviarCorreo(String email) async {
    // Intent mailto completo
    final mailtoUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': 'Contacto desde la aplicación',
        'body': 'Hola, te escribo desde la app de contactos.',
      },
    );

    // Intent web Gmail (fallback)
    final gmailWebUri = Uri.parse(
      'https://mail.google.com/mail/?view=cm&to=$email',
    );

    //Intent nativo
    final launched = await launchUrl(
      mailtoUri,
      mode: LaunchMode.externalApplication,
    );

    //Fallback seguro (SIEMPRE abre)
    if (!launched) {
      await launchUrl(gmailWebUri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactos = ref.watch(contactoProvider);

    // ===============================
    // CONTROLADORES (NUEVOS + EXISTENTES)
    // ===============================
    final TextEditingController nombreCtrl = TextEditingController();
    final TextEditingController descripcionCtrl = TextEditingController();
    final TextEditingController telefonoCtrl = TextEditingController();
    final TextEditingController emailCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Contactos')),

      // ===============================
      // BOTÓN AGREGAR CONTACTO
      // ===============================
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Nuevo Contacto'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nombreCtrl,
                      decoration: const InputDecoration(labelText: 'Nombre'),
                    ),
                    TextField(
                      controller: descripcionCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Descripción',
                      ),
                    ),

                    // ===============================
                    // NUEVO: teléfono
                    // ===============================
                    TextField(
                      controller: telefonoCtrl,
                      decoration: const InputDecoration(labelText: 'Teléfono'),
                      keyboardType: TextInputType.phone,
                    ),

                    // ===============================
                    // NUEVO: email
                    // ===============================
                    TextField(
                      controller: emailCtrl,
                      decoration: const InputDecoration(labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
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
                  onPressed: () async {
                    if (nombreCtrl.text.isEmpty ||
                        descripcionCtrl.text.isEmpty ||
                        telefonoCtrl.text.isEmpty ||
                        emailCtrl.text.isEmpty) {
                      return;
                    }

                    // ===============================
                    // Guardar telefono y mail
                    // ===============================
                    await ref
                        .read(contactoProvider.notifier)
                        .agregar(
                          Contacto(
                            nombre: nombreCtrl.text,
                            description: descripcionCtrl.text,
                            foto: '',
                            telefono: telefonoCtrl.text,
                            email: emailCtrl.text,
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
      ),

      // ===============================
      // LISTADO DE CONTACTOS
      // ===============================
      body: contactos.when(
        data: (list) => ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, i) => ListTile(
            leading: list[i].foto.isNotEmpty
                ? CircleAvatar(backgroundImage: FileImage(File(list[i].foto)))
                : const CircleAvatar(child: Icon(Icons.person)),

            title: Text(list[i].nombre),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(list[i].description),
                Text(list[i].telefono),
                Text(list[i].email),
              ],
            ),

            // ===============================
            // NUEVO: botones de acción
            // ===============================
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.call),
                  onPressed: () => llamar(list[i].telefono),
                ),
                IconButton(
                  icon: const Icon(Icons.email),
                  onPressed: () => enviarCorreo(list[i].email),
                ),
              ],
            ),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}
