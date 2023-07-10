import 'dart:math';
import 'package:flutter/material.dart';

ThemeData lightTheme() => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      // Colors.primaries[Random().nextInt(Colors.primaries.length)],
      // Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
      // floatingActionButtonTheme: const FloatingActionButtonThemeData(
      //   foregroundColor: Color.fromARGB(255, 255, 255, 255),
      // ),
      primaryTextTheme: Typography.blackMountainView,
      textTheme: Typography.blackMountainView,

      // textTheme: const TextTheme(
      //   bodyLarge: TextStyle(),
      //   bodyMedium: TextStyle(),
      //   bodySmall: TextStyle(),
      // ).apply(
      //   bodyColor: Colors.black,
      //   displayColor: Colors.purple,
      // ),
      colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        background: const Color.fromARGB(255, 255, 255, 255),
        // primary: Color.fromARGB(255, 124, 40, 172),
        primary:
            Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
        onSurface: Colors.black,
        // secondary: const Color.fromARGB(255, 202, 18, 18),
      ),
    );

ThemeData darkTheme() => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      primaryTextTheme: Typography.whiteMountainView,
      textTheme: Typography.whiteMountainView,
      // textTheme: const TextTheme(
      //   bodyLarge: TextStyle(),
      //   bodyMedium: TextStyle(),
      //   bodySmall: TextStyle(),
      // ).apply(
      //   bodyColor: Colors.white,
      //   displayColor: Colors.green,
      // ),
      colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        primary:
            Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1),
        // primaryContainer: Color.fromARGB(255, 218, 171, 171),
        // onPrimaryContainer: Color.fromARGB(255, 0, 0, 0),
        // secondary: const Color.fromARGB(255, 255, 255, 255),
        // secondaryContainer: Color.fromARGB(255, 64, 156, 151),
        // onSecondaryContainer: Color.fromARGB(255, 0, 0, 0),
        surface: const Color.fromARGB(255, 176, 80, 186),
        background: const Color.fromARGB(255, 0, 0, 0),
        // error: const Color.fromARGB(255, 199, 40, 40),
        onPrimary: const Color.fromARGB(255, 255, 255, 255),
        // onSecondary: const Color.fromARGB(255, 63, 106, 130),
        onSurface: const Color.fromARGB(255, 255, 255, 255),
        // onBackground: const Color.fromARGB(255, 38, 125, 156),
        // onError: const Color.fromARGB(255, 100, 100, 100),
      ),
    );
