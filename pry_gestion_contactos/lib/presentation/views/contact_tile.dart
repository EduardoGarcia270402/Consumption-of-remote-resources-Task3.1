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
