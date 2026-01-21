import 'package:flutter/material.dart';

ThemeData obtenerTema(Color seedColor) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
  );
}
