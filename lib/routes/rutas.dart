import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/colores.dart';
import 'package:flutter_application_2/screens/pagina_agregar_tarea.dart';
import 'package:flutter_application_2/screens/pagina_principal.dart';

/// Clase utilitaria para la gestión de rutas de navegación.
class Rutas {
  /// Ruta de la pantalla principal.
  static const String paginaPrincipal = '/';

  /// Ruta de la pantalla para agregar una nueva tarea.
  static const String pagAgregarTarea = '/agregar_tarea';

  /// Genera la ruta correspondiente según [ajustes].
  ///
  /// Requiere funciones callback [alCambiarModo] y [alCambiarColor] para pasar el estado global
  /// a la [PaginaPrincipal], así como el [colorActual].
  static Route<dynamic> generarRuta(
    RouteSettings ajustes,
    Function(bool) alCambiarModo,
    Function(int) alCambiarColor,
    Colores colorActual,
  ) {
    switch (ajustes.name) {
      case paginaPrincipal:
        return MaterialPageRoute(
          builder: (context) => PaginaPrincipal(
            alCambiarModo: alCambiarModo,
            alCambiarColor: alCambiarColor,
            colorActual: colorActual,
          ),
        );
      case pagAgregarTarea:
        return MaterialPageRoute(builder: (context) => PaginaAgregarTarea());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text("Error: ruta no encontrada")),
          ),
        );
    }
  }
}
