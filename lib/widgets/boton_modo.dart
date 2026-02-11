import 'package:flutter/material.dart';

/// Botón que permite alternar entre el modo claro y oscuro de la aplicación.
class BotonModo extends StatelessWidget {
  const BotonModo({super.key, required this.cambiarModo});

  /// Callback que se ejecuta al presionar el botón.
  final Function cambiarModo;

  @override
  Widget build(BuildContext context) {
    final esDeDia = Theme.of(context).brightness == Brightness.light;
    return IconButton(
      icon: esDeDia
          ? Icon(Icons.dark_mode_outlined)
          : Icon(Icons.light_mode_outlined),
      onPressed: () => cambiarModo(!esDeDia),
    );
  }
}
