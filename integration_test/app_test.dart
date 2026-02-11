import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_application_2/main.dart' as app;
import 'package:flutter_application_2/widgets/boton_modo.dart';
import 'package:flutter_application_2/widgets/boton_tema.dart';

/// Pruebas de integración para verificar el flujo completo de la aplicación.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Pruebas de flujo completo de usuario', () {
    testWidgets('Cambiar modo y color en el emulador real', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final botonModo = find.byType(BotonModo);
      expect(botonModo, findsOneWidget);

      await tester.tap(botonModo);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      final botonColor = find.byType(BotonColor);
      await tester.tap(botonColor);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await tester.tap(find.text('Azul').last);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
    });
  });
}
