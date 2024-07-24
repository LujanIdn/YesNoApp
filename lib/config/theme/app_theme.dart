import 'package:flutter/material.dart';

const List<Color> coloThemes = [
  Colors.purple,
  Colors.pink,
  Color.fromARGB(255, 255, 0, 0)
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= coloThemes.length - 1);

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: coloThemes[selectedColor],
        brightness: Brightness.light);
  }
}
