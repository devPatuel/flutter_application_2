import 'package:flutter/material.dart';

class BotonModo extends StatelessWidget {
  const BotonModo({super.key, required this.cambiarModo});
  
  final Function cambiarModo;

  @override
  Widget build(BuildContext context) {
      final esDeDia = Theme.of(context).brightness == Brightness.light;
      return IconButton(
        icon: esDeDia 
        ? Icon(Icons.dark_mode_outlined)
        : Icon(Icons.light_mode_outlined),
        onPressed:() => cambiarModo(!esDeDia),
        );
  }
}