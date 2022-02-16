import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  ThemeMode get getTheme => themeMode;

  void toggleTheme(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }
}

class MyTheme {
  static final darkTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    dividerColor: Colors.blue[600],
    scaffoldBackgroundColor: const Color(0xFF041C38),
    primaryColor: const Color(0xFF041C38),
    unselectedWidgetColor: Color(0xFF726D78),
    selectedRowColor: Color(0xFFF2F1EB),
    shadowColor: Color(0xFF041C38),
    colorScheme: ColorScheme.dark(
        primary: Color(0xFF041C38), background: Color(0xFF064FC9)),
    fontFamily: 'Montserrat',
    iconTheme: IconThemeData(
      color: Color(0xFF4474C4),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
          color: Color(0xFFF6F4F3), fontSize: 30, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(color: Color(0xFFF6F4F3), fontSize: 17),
      subtitle1: TextStyle(color: Color(0xFFF6F4F3), fontSize: 13),
      bodyText2: TextStyle(color: Color(0xFFF6F4F3), fontSize: 17),
      caption: TextStyle(color: Color(0xFFF6F4F3), fontSize: 13),
      headline2: TextStyle(color: Color(0xFFF6F4F3)),
      headline3: TextStyle(color: Color(0xFFF6F4F3)),
      headline4: TextStyle(color: Color(0xFFF6F4F3)),
      headline5: TextStyle(color: Color(0xFFF6F4F3)),
      headline6: TextStyle(color: Color(0xFFF6F4F3)),
      overline: TextStyle(
          color: Color(0xFFF6F4F3), fontSize: 11, fontWeight: FontWeight.w400),
      subtitle2: TextStyle(
          color: Color(0xFFF6F4F3), fontSize: 20, fontWeight: FontWeight.w500),
      button: TextStyle(color: Color(0xFFF6F4F3), fontSize: 17),
    ),
  );

  static final lightTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    dividerColor: Colors.teal[300],
    scaffoldBackgroundColor: Colors.teal[50],
    primaryColor: Colors.teal[50],
    unselectedWidgetColor: Colors.blueGrey,
    selectedRowColor: Colors.teal,
    shadowColor: Colors.teal[900],
    colorScheme: ColorScheme.light(
        primary: Color(0xFFF6F4F3), background: Color(0xFF80CBC4)),
    fontFamily: 'Montserrat',
    iconTheme: const IconThemeData(
      color: Colors.teal,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
          color: Color(0xFF455A64), fontSize: 30, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(color: Color(0xFF455A64), fontSize: 17),
      subtitle1: TextStyle(color: Color(0xFF455A64), fontSize: 13),
      bodyText2: TextStyle(color: Color(0xFF455A64), fontSize: 17),
      caption: TextStyle(color: Color(0xFF455A64), fontSize: 13),
      headline2: TextStyle(color: Color(0xFF455A64)),
      headline3: TextStyle(color: Color(0xFF455A64)),
      headline4: TextStyle(color: Color(0xFF455A64)),
      headline5: TextStyle(color: Color(0xFF455A64)),
      headline6: TextStyle(color: Color(0xFF455A64)),
      overline: TextStyle(
          color: Color(0xFF455A64), fontSize: 13, fontWeight: FontWeight.w400),
      subtitle2: TextStyle(
          color: Color(0xFF455A64), fontSize: 20, fontWeight: FontWeight.w500),
      button: TextStyle(color: Color(0xFF455A64), fontSize: 17),
    ),
  );
}
