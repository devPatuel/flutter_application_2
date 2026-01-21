class Tarea {
  Tarea({
    required this.titulo,
    required this.descripcion,
    required this.estaTerminada,
    required this.categoria,
  });

  String titulo;
  String descripcion;
  Categoria categoria;
  bool estaTerminada;
}

enum Categoria {
    personal,
    trabajo,
    otro,
  }