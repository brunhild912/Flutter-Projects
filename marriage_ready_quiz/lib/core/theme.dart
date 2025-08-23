import 'package:flutter/material.dart';

ThemeData buildTheme() {
  final base = ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal);
  return base.copyWith(
    appBarTheme: const AppBarTheme(centerTitle: true),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
