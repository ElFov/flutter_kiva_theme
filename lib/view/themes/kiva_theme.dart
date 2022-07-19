//This class will hold and keep custom widgets, colors and font for other projects.
import 'package:flutter/material.dart';
import 'package:flutter_kiva_theme/view/themes/kiva_theme_const.dart';

//Enum
enum typeButton { classic, round }

class KivaTheme {
  //Colors
  ThemeData themedata = ThemeData(
    appBarTheme: const AppBarTheme(
      color: kMainColor,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
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
        fillColor: MaterialStateProperty.all(kCheckBoxFillColor),
        overlayColor: MaterialStateProperty.all(kCheckBoxOverlayColor),
        shape: const CircleBorder()),
  );

  //Widget
  //OutlinedButton
//TODO Finish refactacoring the buttons.
  OutlinedButton KivaButtonCfg(
      VoidCallback logic, String data, typeButton selected) {
    return OutlinedButton(
      onPressed: logic,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kMainColor),
        fixedSize: MaterialStateProperty.all(
            const Size(kMainButtonWidth, kMainButtonHeight)),
        shape: selected == typeButton.classic
            ? MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)))
            : null,
      ),
      child: Center(
        child: Text(
          data,
          style: const TextStyle(color: kBodyColorText),
        ),
      ),
    );
  }

  OutlinedButton KivaDefaultButton(VoidCallback logic, String data) {
    return OutlinedButton(
      onPressed: logic,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kMainColor),
        fixedSize: MaterialStateProperty.all(
            const Size(kMainButtonWidth, kMainButtonHeight)),
        shape: null,
      ),
      child: Center(
        child: Text(
          data,
          style: const TextStyle(color: kBodyColorText),
        ),
      ),
    );
  }

  OutlinedButton KivaMenuButton(VoidCallback logic, String data) {
    return OutlinedButton(
      onPressed: logic,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kMainColor),
        fixedSize: MaterialStateProperty.all(
            const Size(kMainButtonWidth, kMainButtonHeight)),
        shape: null,
      ),
      child: Center(
        child: Text(
          data,
          style: const TextStyle(color: kBodyColorText),
        ),
      ),
    );
  }

  OutlinedButton KivaMenuRoundButton(VoidCallback logic, String data) {
    return OutlinedButton(
      onPressed: logic,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kMainColor),
        fixedSize: MaterialStateProperty.all(
            const Size(kMainButtonWidth, kMainButtonHeight)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
      ),
      child: Center(
        child: Text(
          data,
          style: const TextStyle(color: kBodyColorText),
        ),
      ),
    );
  }
}
