import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF020457);
  static const Color scaffoldBackgroundColor = Color(0xFF020457);
  static const Color cardColor1 = Color(0xFFd6f6ff);
  static const Color cardColor2 = Color(0xFFe9edff);
  static const Color cardColor3 = Color(0xFFd6fff3);
  static const Color whiteColor = Colors.white;
  static const Color bt1Card1 = Color(0xFF9cd6e7);
  static const Color bt1Card2 = Color(0xFFafb6e5);
  static const Color bt1Card3 = Color(0xFF0a33c3);

  static const TextStyle headlineLarge = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );

  static const TextStyle headLineMedium = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );

  static const TextStyle bodyTextLarge = TextStyle(
    fontSize: 16.0,
    color: primaryColor,
  );
  static const TextStyle bodyTextSmall = TextStyle(
    fontSize: 14.0,
    color: Colors.black,
  );

  static ThemeData get themeData {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        headlineLarge: headlineLarge,
        headlineMedium: headLineMedium,
        bodySmall: bodyTextSmall,
        bodyLarge: bodyTextLarge,
      ),
    );
  }
}
