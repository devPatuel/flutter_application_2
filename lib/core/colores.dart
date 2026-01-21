import 'package:flutter/material.dart';

enum Colores {
  purpurOscuro('Púrpura oscuro', Colors.deepPurple),
  purpura('Púrpura', Colors.purple),
  anyil('Añil', Colors.indigo),
  azul('Azul', Colors.blue),
  verde('Verde', Colors.green),
  amarillo('Amarillo', Colors.yellow),
  naranja('Naranja', Colors.orange),
  rojo('Rojo', Colors.red);

  const Colores(this.etiqueta, this.color);

  final String etiqueta;
  final Color color;
}

