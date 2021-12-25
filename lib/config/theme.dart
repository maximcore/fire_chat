import 'package:flutter/material.dart';

ThemeData customAppTheme() {
  return ThemeData.from(
    colorScheme: const ColorScheme(
      background: Color(0xffffffff),
      error: Color(0xffe33434),
      onBackground: Color(0xffffffff),
      onError: Color(0xffe33434),
      brightness: Brightness.light,
      onSecondary: Color(0xffffffff),
      onSurface: Color(0xffffffff),
      onPrimary: Color(0xffffffff),
      primary: Color(0xffef7f52),
      secondary: Color(0xFF8ac185),
      surface: Color(0xfff3d3ca),
      primaryVariant: Color(0xffb45e38),
      secondaryVariant: Color(0xff5b9957),
    ),
    textTheme: const TextTheme(
      headline6: TextStyle(color: Colors.black),
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.black),
      button: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

ThemeData customAppThemeDark() {
  return ThemeData.from(
    colorScheme: const ColorScheme(
      background: Color(0xff322c5c),
      error: Color(0xffe33434),
      onBackground: Color(0xffffffff),
      onError: Color(0xffe33434),
      brightness: Brightness.dark,
      onSecondary: Color(0xffffffff),
      onSurface: Color(0xffffffff),
      onPrimary: Color(0xffffffff),
      primary: Color(0xFF7768d8),
      secondary: Color(0xffefaf91),
      surface: Color(0xff393166),
      primaryVariant: Color(0xff604bde),
      secondaryVariant: Color(0xffa15333),
    ),
    textTheme: const TextTheme(
      headline6: TextStyle(color: Colors.white),
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
      button: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
