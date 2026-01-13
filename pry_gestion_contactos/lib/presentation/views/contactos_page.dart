import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/contacto_provider.dart';
import '../../domain/entities/contacto.dart';
import 'contact_tile.dart';

class ContactosPage extends ConsumerStatefulWidget {
  const ContactosPage({super.key});

  @override
  ConsumerState<ContactosPage> createState() => _ContactosPageState();
}

class _ContactosPageState extends ConsumerState<ContactosPage> {
  // ===============================
  // CONTROLADORES (NO SE RECREAN)
  // ===============================
  final TextEditingController searchCtrl = TextEditingController();
  final TextEditingController nombreCtrl = TextEditingController();
  final TextEditingController descripcionCtrl = TextEditingController();
  final TextEditingController telefonoCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();

  bool asc = true;

  @override
  void dispose() {
    searchCtrl.dispose();
    nombreCtrl.dispose();
    descripcionCtrl.dispose();
    telefonoCtrl.dispose();
    emailCtrl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(contactoProvider.notifier).cargar();
    });
  }

  // ===============================
  // ACCIONES
  // ===============================
  Future<void> llamar(String telefono) async {
    final uri = Uri.parse('tel:$telefono');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> enviarCorreo(String email) async {
    final mailtoUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': 'Contacto desde la aplicación',
        'body': 'Hola, te escribo desde la app de contactos.',
      },
    );

    await launchUrl(mailtoUri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final contactos = ref.watch(contactoProvider);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchCtrl,
          decoration: const InputDecoration(
            hintText: 'Buscar contacto...',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (value) {
            ref.read(contactoProvider.notifier).buscar(value, asc);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(asc ? Icons.sort_by_alpha : Icons.sort),
            onPressed: () {
              asc = !asc;
              ref.read(contactoProvider.notifier).buscar(searchCtrl.text, asc);
              setState(() {});
            },
          ),
        ],
      ),

      // ===============================
      // BOTÓN AGREGAR
      // ===============================
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final _formKey = GlobalKey<FormState>();

          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Nuevo Contacto'),
              content: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nombreCtrl,
                        decoration: const InputDecoration(labelText: 'Nombre'),
                        validator: (v) => (v == null || v.trim().isEmpty) ? 'Ingrese el nombre del contacto' : null,
                      ),
                      TextFormField(
                        controller: descripcionCtrl,
                        decoration: const InputDecoration(
                          labelText: 'Descripción',
                        ),
                      ),
                      TextFormField(
                        controller: telefonoCtrl,
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
                    final telefono = telefonoCtrl.text.trim();
                    final email = emailCtrl.text.trim();

                    await ref
                        .read(contactoProvider.notifier)
                        .agregar(
                          Contacto(
                            nombre: nombre,
                            description: descripcionCtrl.text,
                            foto: '',
                            telefono: telefono,
                            email: email,
                          ),
                        );

                    nombreCtrl.clear();
                    descripcionCtrl.clear();
                    telefonoCtrl.clear();
                    emailCtrl.clear();

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
      // LISTA
      // ===============================
      body: contactos.when(
        data: (list) => ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, i) =>
              ContactTile(contacto: list[i], mostrarFavorito: true),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}
