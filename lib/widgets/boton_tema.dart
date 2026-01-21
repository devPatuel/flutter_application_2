import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/colores.dart';

class BotonColor extends StatelessWidget {
  const BotonColor({
    super.key,
    required this.cambiarColor,
    required this.colorElegido,
  });

  final void Function(int) cambiarColor;
  final Colores colorElegido;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.opacity_outlined,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      itemBuilder: (context) {
        return List.generate(Colores.values.length, (inx) {
          final color = Colores.values[inx];
          return PopupMenuItem(
            value: inx,
            enabled: color != colorElegido,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Icon(Icons.opacity_outlined, color: color.color),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(color.etiqueta),
                ),
              ],
            ),
          );
        });
      },
      onSelected: cambiarColor,
    );
  }
}
