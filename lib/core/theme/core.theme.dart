import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoreTheme {
  CoreTheme._();

  static ThemeData get themeDefault => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        dividerTheme: const DividerThemeData(),
        appBarTheme: const AppBarTheme(centerTitle: true),
        dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        inputDecorationTheme: const InputDecorationTheme(),
      );

  static ColorScheme get colorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.black,
        onPrimary: Colors.black,
        secondary: Colors.black,
        onSecondary: Colors.black,
        error: Colors.black,
        onError: Colors.black,
        background: Colors.black,
        onBackground: Colors.black,
        surface: Colors.black,
        onSurface: Colors.black,
      );

  static TextTheme get textTheme => TextTheme();

  static CupertinoThemeData get cupertinoOverrideTheme =>
      const CupertinoThemeData(
        brightness: Brightness.light,
        textTheme: CupertinoTextThemeData(),
      );
}
