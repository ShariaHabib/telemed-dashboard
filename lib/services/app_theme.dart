import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF020457);
  static const Color scaffoldBackgroundColor = Color(0xFF020457);
  static const Color cardColor = Color(0xFFE0F7FA);
  static const Color whiteColor = Colors.white;
  static final TextStyle headline1 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: whiteColor,
  );

  static final TextStyle headline6 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );

  static final TextStyle bodyText2 = TextStyle(
    fontSize: 12.0,
    color: whiteColor,
  );
  static ThemeData get themeData {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      cardColor: cardColor,
      fontFamily: 'Roboto',
      textTheme: TextTheme(
        headlineLarge: headline1,
        headlineMedium: headline6,
        bodySmall: bodyText2,
      ),
    );
  }
}
