import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/colores.dart';
import 'package:flutter_application_2/core/mi_tema.dart';
import 'package:flutter_application_2/routes/rutas.dart';
import 'package:flutter_application_2/widgets/boton_modo.dart';
import 'package:flutter_application_2/widgets/boton_tema.dart';

final temaActual = ValueNotifier<Color>(Colors.blue);

/// Punto de entrada de la aplicación.
void main() {
  runApp(const MainApp());
}

/// Widget raíz de la aplicación.
///
/// Gestiona el estado global del tema (modo claro/oscuro y color seleccionado).
class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode _modoTema = ThemeMode.light;
  Colores _colorElegido = Colores.purpurOscuro;

  void cambiarModo(bool esDeDia) {
    setState(() {
      _modoTema = esDeDia ? ThemeMode.light : ThemeMode.dark;
    });
  }

  void cambiarColor(int valor) {
    setState(() {
      _colorElegido = Colores.values[valor];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _modoTema,
      theme: ThemeData(
        colorSchemeSeed: _colorElegido.color,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: _colorElegido.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      initialRoute: Rutas.paginaPrincipal,
      onGenerateRoute: (settings) => Rutas.generarRuta(
        settings,
        cambiarModo, // Pasamos la función como referencia
        cambiarColor, // Pasamos la función como referencia
        _colorElegido, // Pasamos el estado actual
      ),
    );
  }
}
