class Contacto {
  final int? id;
  final String nombre;
  final String description;
  final String foto;
  final String telefono;
  final String email;
  final bool favorito;


  Contacto({
    this.id,
    required this.nombre,
    required this.description,
    required this.foto,
    required this.telefono,
    required this.email,
    this.favorito = false,
  });
}
