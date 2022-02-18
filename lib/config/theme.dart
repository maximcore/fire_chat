import 'package:flutter/material.dart';

class CustomAppTheme {
  // TODO(Maxim): Change from getter to final
  static ThemeData get lightTheme => ThemeData.from(
        colorScheme: const ColorScheme(
          background: Color(0xffffffff),
          error: Color(0xffe33434),
          onBackground: Color(0xffffffff),
          onError: Color(0xffe33434),
          brightness: Brightness.light,
          onSecondary: Color(0xff000000),
          onSurface: Color(0xff000000),
          onPrimary: Color(0xff000000),
          primary: Color(0xffe1e1e1),
          secondary: Color(0xff000000),
          surface: Color(0xffffffff),
          primaryContainer: Color(0xffb45e38),
          secondaryContainer: Color(0xff604bde),
        ),
        textTheme: const TextTheme(
          headline6: TextStyle(color: Colors.black),
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          button: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData.from(
        colorScheme: const ColorScheme(
          background: Color(0xff131313),
          error: Color(0xffe33434),
          onBackground: Color(0xffffffff),
          onError: Color(0xffe33434),
          brightness: Brightness.dark,
          onSecondary: Color(0xffffffff),
          onSurface: Color(0xffffffff),
          onPrimary: Color(0xffffffff),
          primary: Color(0xff000000),
          secondary: Color(0xff181818),
          surface: Color(0xff000000),
          primaryContainer: Color(0xff604bde),
          secondaryContainer: Color(0xffa15333),
        ),
        textTheme: const TextTheme(
          headline6: TextStyle(color: Colors.white),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
          button: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
