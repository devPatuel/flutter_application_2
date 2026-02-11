import 'package:flutter/material.dart';

/// Enumeración que define los colores temáticos disponibles en la aplicación.
///
/// Cada valor tiene una [etiqueta] descriptiva y un [color] de Material.
enum Colores {
  purpurOscuro('Púrpura oscuro', Colors.deepPurple),
  purpura('Púrpura', Colors.purple),
  anyil('Añil', Colors.indigo),
  azul('Azul', Colors.blue),
  verde('Verde', Colors.green),
  amarillo('Amarillo', Colors.yellow),
  naranja('Naranja', Colors.orange),
  rojo('Rojo', Colors.red);

  /// Crea una instancia de [Colores].
  const Colores(this.etiqueta, this.color);

  /// Nombre legible del color.
  final String etiqueta;

  /// El color de Flutter asociado.
  final Color color;
}
