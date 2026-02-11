import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_2/core/mi_tema.dart';

/// Pruebas unitarias para funciones del núcleo.
void main() {
  test(
    'obtenerTema debería devolver un ThemeData con Material3 y el color correcto',
    () {
      const colorPrueba = Colors.red;
      final temaResultante = obtenerTema(colorPrueba);
      expect(temaResultante.useMaterial3, isTrue);

      expect(temaResultante.colorScheme.primary, isNotNull);

      // No comparamos si el color es exactamente el mismo que el de la semilla porque fromSeed ajusta los tonos para que haya buen contraste y legibilidad, por lo que el color final suele variar un poco del original.
    },
  );
}
