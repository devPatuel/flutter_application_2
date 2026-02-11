import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/widgets/boton_modo.dart';
import 'package:flutter_application_2/widgets/boton_tema.dart';

/// Pruebas de integración de widgets.
void main() {
  group('Widgets', () {
    testWidgets(
      'La pantalla principal debe cargar los botones de configuración',
      (WidgetTester tester) async {
        await tester.pumpWidget(const MainApp());
        await tester.pumpAndSettle();

        expect(find.byType(BotonModo), findsOneWidget);
        expect(find.byType(BotonColor), findsOneWidget);
      },
    );

    testWidgets('Al pulsar BotonModo debe cambiar el icono', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MainApp());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.dark_mode_outlined), findsOneWidget);

      await tester.tap(find.byType(BotonModo));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.light_mode_outlined), findsOneWidget);
    });
  });
}
