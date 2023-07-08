import 'dart:math';
import 'package:flutter/material.dart';

ThemeData lightTheme() => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor:
          // Colors.primaries[Random().nextInt(Colors.primaries.length)],
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
      // floatingActionButtonTheme: const FloatingActionButtonThemeData(
      //   foregroundColor: Color.fromARGB(255, 255, 255, 255),
      // ),
      colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        background: const Color.fromARGB(255, 255, 255, 255),
        // primary: Color.fromARGB(255, 124, 40, 172),
        primary:
            Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
        secondary: const Color.fromARGB(255, 202, 18, 18),
      ),
    );

ThemeData darkTheme() => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor:
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1),
      colorScheme: const ColorScheme.dark(
        brightness: Brightness.dark,
        primary: Color.fromARGB(255, 255, 255, 255),
        // primaryContainer: Color.fromARGB(255, 218, 171, 171),
        // onPrimaryContainer: Color.fromARGB(255, 0, 0, 0),
        secondary: Color.fromARGB(255, 255, 255, 255),
        // secondaryContainer: Color.fromARGB(255, 64, 156, 151),
        // onSecondaryContainer: Color.fromARGB(255, 0, 0, 0),
        surface: Color.fromARGB(255, 199, 40, 40),
        background: Color.fromARGB(255, 0, 0, 0),
        error: Color.fromARGB(255, 199, 40, 40),
        onPrimary: Color.fromARGB(255, 0, 0, 0),
        onSecondary: Color.fromARGB(255, 0, 0, 0),
        onSurface: Color.fromARGB(255, 255, 255, 255),
        onBackground: Color.fromARGB(255, 255, 255, 255),
        onError: Color.fromARGB(255, 255, 255, 255),
      ),
    );
