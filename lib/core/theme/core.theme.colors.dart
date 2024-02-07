import 'package:flutter/material.dart';

extension CoreThemeColorsScheme on ColorScheme {
  Color get success => CoreThemeColors.primary;
}

class CoreThemeColors {
  CoreThemeColors._();

  static const Color primary = Color(0xFF008A23);
}
