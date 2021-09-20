import 'package:flutter/material.dart';
import 'package:visa_test/constants/constants.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.teal,
    fontFamily: APP_FONT,
    primaryColor: Colors.teal,
    primaryColorLight: Colors.teal[500],
    appBarTheme: AppBarTheme(
      color: Colors.teal,
      iconTheme: IconThemeData(
        color: Colors.grey,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.grey,
      onPrimary: Colors.grey,
      primaryVariant: Colors.white38,
      secondary: Colors.teal,
    ),
    cardTheme: CardTheme(
      color: Colors.teal,
    ),
    iconTheme: IconThemeData(
      color: Colors.grey,
    ),
  );
}
