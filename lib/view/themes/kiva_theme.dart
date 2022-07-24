//This class will hold and keep custom widgets, colors and font for other projects.
import 'package:flutter/material.dart';
import 'package:flutter_kiva_theme/view/themes/kiva_theme_const.dart';

//Enum
enum typeButton { classic, round }

enum typeTextField { simple, boxed }

enum levelAuth { admin, manager, reader }

class KivaTheme {
  //Colors
  ThemeData themedata = ThemeData(
      appBarTheme: const AppBarTheme(
        color: kMainColor,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: kMainColor,
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
      focusColor: kMainColor);

  //Widget
  //TextButton
  TextButton KivaButtonCfg(
      VoidCallback logic, String data, typeButton selected) {
    return TextButton(
      onPressed: logic,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kMainColor),
        fixedSize: MaterialStateProperty.all(
            const Size(kMainButtonWidth, kMainButtonHeight)),
        shape: selected == typeButton.round
            ? MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kMainButtonCircular)))
            : null,
        overlayColor: MaterialStateProperty.all(kFloatActionButtonHoverColor),
        // side: MaterialStateProperty.all(
        //     const BorderSide(width: kMainButtonBorderWidth, color: kMainColor)),
      ),
      child: Center(
        child: Text(
          data,
          style: const TextStyle(color: kBodyColorText),
        ),
      ),
    );
  }

  //TextField
  TextField KivaTextFieldCfg(
      String hintText, bool isPassword, typeTextField selected) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: selected == typeTextField.boxed
            ? const OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(kMainButtonCircular)),
                borderSide: BorderSide(
                    color: kMainColor,
                    width: kTextFieldBorderWidth,
                    style: BorderStyle.solid),
              )
            : null,
        enabledBorder: selected == typeTextField.boxed
            ? const OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(kMainButtonCircular)),
                borderSide: BorderSide(
                    color: kMainColor,
                    width: kMainButtonBorderWidth,
                    style: BorderStyle.solid),
              )
            : const UnderlineInputBorder(
                borderSide: BorderSide(
                    color: kMainColor,
                    width: kMainButtonBorderWidth,
                    style: BorderStyle.solid),
              ),
        focusedBorder: selected == typeTextField.boxed
            ? const OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(kMainButtonCircular)),
                borderSide: BorderSide(
                    color: kMainColor,
                    width: kTextFieldBorderWidth,
                    style: BorderStyle.solid),
              )
            : const UnderlineInputBorder(
                borderSide: BorderSide(
                    color: kMainColor,
                    width: kTextFieldBorderWidth,
                    style: BorderStyle.solid),
              ),
      ),
      obscureText: isPassword == true ? true : false,
    );
  }

  MaterialApp KivaTabs(String name, levelAuth auth) {
    return MaterialApp(
      theme: KivaTheme().themedata,
      home: DefaultTabController(
        length: auth == levelAuth.admin ? 3 : 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              auth == levelAuth.admin
                  ? '$name (Mode administrateur)'
                  : '$name (Mode manager/consultation)',
              style: const TextStyle(color: kFloatActionButtonColor),
            ),
            elevation: 0.0,
            backgroundColor: Colors.white,
            bottom: auth == levelAuth.admin
                ? const TabBar(
                    labelColor: kFloatActionButtonColor,
                    unselectedLabelColor: kFloatActionButtonColor,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: kTextFieldBorderWidth,
                        color: kCheckBoxFillColor,
                      ),
                      insets: EdgeInsets.symmetric(
                          horizontal: kMainButtonBorderWidth),
                    ),
                    tabs: [
                      Tab(
                        text: kTabsName1,
                      ),
                      Tab(
                        text: kTabsName2,
                      ),
                      Tab(
                        text: kTabsName3,
                      ),
                    ],
                  )
                : const TabBar(
                    labelColor: kFloatActionButtonColor,
                    unselectedLabelColor: kFloatActionButtonColor,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: kTextFieldBorderWidth,
                        color: kCheckBoxFillColor,
                      ),
                      insets: EdgeInsets.symmetric(
                          horizontal: kMainButtonBorderWidth),
                    ),
                    tabs: [
                      Tab(
                        text: kTabsName2,
                      ),
                      Tab(
                        text: kTabsName3,
                      ),
                    ],
                  ),
          ),
          //TODO replace childs with menus and buttons
          body: auth == levelAuth.admin
              ? const TabBarView(
                  children: [
                    Icon(Icons.directions_car),
                    Icon(Icons.directions_transit),
                    Icon(Icons.directions_bike),
                  ],
                )
              : const TabBarView(
                  children: [
                    Icon(Icons.directions_transit),
                    Icon(Icons.directions_bike),
                  ],
                ),
        ),
      ),
    );
  }
  /* TextButton KivaDefaultButton(VoidCallback logic, String data) {
    return TextButton(
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

  TextButton KivaMenuButton(VoidCallback logic, String data) {
    return TextButton(
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

  TextButton KivaMenuRoundButton(VoidCallback logic, String data) {
    return TextButton(
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
  }*/
}
