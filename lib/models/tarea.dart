/// Modelo de datos para una tarea.
class Tarea {
  /// Crea una instancia de [Tarea] con los datos requeridos.
  Tarea({
    required this.titulo,
    required this.descripcion,
    required this.estaTerminada,
    required this.categoria,
  });

  /// El título de la tarea.
  String titulo;

  /// La descripción detallada de la tarea.
  String descripcion;

  /// La categoría asignada a la tarea.
  Categoria categoria;

  /// Estado de finalización de la tarea.
  bool estaTerminada;
}

/// Categorías disponibles para clasificar las tareas.
enum Categoria {
  /// Asuntos personales.
  personal,

  /// Asuntos laborales.
  trabajo,

  /// Otras categorías.
  otro,
}
