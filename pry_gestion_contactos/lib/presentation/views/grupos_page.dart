import 'package:flutter/material.dart';

class GruposPage extends StatelessWidget {
  const GruposPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '👥 Grupos\n(Aquí se mostrarán los grupos de contactos)',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
