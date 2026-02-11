import 'package:flutter/material.dart';

/// Genera la configuración de tema ([ThemeData]) para la aplicación.
///
/// Crea un esquema de colores basado en [seedColor] y habilita Material 3.
ThemeData obtenerTema(Color seedColor) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
  );
}
