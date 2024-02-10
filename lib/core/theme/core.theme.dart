import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoreTheme {
  CoreTheme._();

  static ThemeData get themeDefault => ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      dividerTheme: const DividerThemeData(),
      useMaterial3: false,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: colorScheme.primary.withOpacity(0.80),
          titleTextStyle: textTheme.titleLarge,
          iconTheme: IconThemeData(color: colorScheme.onPrimary)),
      scaffoldBackgroundColor: colorScheme.background,
      textTheme: textTheme,
      colorScheme: colorScheme,
      dialogTheme: DialogTheme(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          filled: true,
          fillColor: Colors.white,
          errorStyle:
              TextStyle(fontWeight: FontWeight.w500, color: colorScheme.error),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.black54)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: colorScheme.error))),
      textButtonTheme: TextButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              disabledBackgroundColor: colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              enableFeedback: true)));

  static ColorScheme get colorScheme => const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 111, 86, 145),
      onPrimary: Colors.white,
      secondary: Color(0xFF0072ED),
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black54);

  static TextTheme get textTheme => const TextTheme(
      titleLarge: TextStyle(color: Colors.black, fontSize: 18, height: 1.27),
      titleMedium: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.5,
          letterSpacing: 0.15),
      titleSmall: TextStyle(
          color: Colors.black,
          height: 1.71,
          letterSpacing: 0.1,
          fontSize: 14,
          fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(
          color: Colors.black87,
          fontSize: 16,
          height: 1.5,
          letterSpacing: 0.15,
          fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(
          color: Colors.black87,
          height: 1.71,
          fontSize: 14,
          letterSpacing: 0.25,
          fontWeight: FontWeight.w400),
      bodySmall: TextStyle(
          color: Colors.black87,
          height: 1.33,
          fontSize: 12,
          letterSpacing: 0.4,
          fontWeight: FontWeight.w400),
      labelLarge: TextStyle(
          color: Colors.black87,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1.714,
          letterSpacing: 0.1),
      labelMedium: TextStyle(color: Colors.black),
      labelSmall: TextStyle(
          color: Colors.black54,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontSize: 10,
          height: 1.45,
          letterSpacing: 0.5));

  static CupertinoThemeData get cupertinoOverrideTheme =>
      const CupertinoThemeData(brightness: Brightness.light);
}
