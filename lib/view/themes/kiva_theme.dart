//This class will hold and keep custom widgets, colors and font for other projects.
import 'package:flutter/material.dart';
import 'package:flutter_kiva_theme/view/themes/kiva_theme_const.dart';

class KivaTheme {
  //Colors
  ThemeData themedata = ThemeData(
    appBarTheme: const AppBarTheme(
      color: kMainColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: kMainColor,
      ),
    ),
    scaffoldBackgroundColor: kAppBackgroundColor,
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: kBodyColorText,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: kFloatActionButtonColor,
        hoverColor: kFloatActionButtonHoverColor),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(Colors.orange[500]),
    ),
  );
}
