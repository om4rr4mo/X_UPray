import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyTheme {
  static final darkTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    scaffoldBackgroundColor: const Color(0xFF041C38),
    primaryColor: const Color(0xFF041C38),
    unselectedWidgetColor: Color(0xFF726D78),
    selectedRowColor: Color(0xFFF2F1EB),
    shadowColor: Color(0xFF041C38),
    colorScheme: ColorScheme.dark(primary: Color(0xFF041C38)),
    fontFamily: 'Montserrat',
    iconTheme: IconThemeData(
      color: Color(0xFF4474C4),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(color: Color(0xFFF6F4F3)),
      bodyText1: TextStyle(color: Color(0xFFF6F4F3)),
      subtitle1: TextStyle(color: Color(0xFFF6F4F3)),
      bodyText2: TextStyle(color: Color(0xFFF6F4F3)),
      caption: TextStyle(color: Color(0xFFF6F4F3)),
      headline2: TextStyle(color: Color(0xFFF6F4F3)),
      headline3: TextStyle(color: Color(0xFFF6F4F3)),
      headline4: TextStyle(color: Color(0xFFF6F4F3)),
      headline5: TextStyle(color: Color(0xFFF6F4F3)),
      headline6: TextStyle(color: Color(0xFFF6F4F3)),
      overline: TextStyle(color: Color(0xFFF6F4F3)),
      subtitle2: TextStyle(color: Color(0xFFF6F4F3)),
      button: TextStyle(color: Colors.black),
    ),
  );

  static final lightTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    scaffoldBackgroundColor: Colors.teal[50],
    primaryColor: Colors.teal[50],
    unselectedWidgetColor: Colors.blueGrey,
    selectedRowColor: Colors.teal,
    shadowColor: Colors.teal[900],
    colorScheme: ColorScheme.light(primary: Color(0xFFF6F4F3)),
    fontFamily: 'Montserrat',
    iconTheme: const IconThemeData(
      color: Colors.teal,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(color: Color(0xFF455A64)),
      bodyText1: TextStyle(color: Color(0xFF455A64)),
      subtitle1: TextStyle(color: Color(0xFF455A64)),
      bodyText2: TextStyle(color: Color(0xFF455A64)),
      caption: TextStyle(color: Color(0xFF455A64)),
      headline2: TextStyle(color: Color(0xFF455A64)),
      headline3: TextStyle(color: Color(0xFF455A64)),
      headline4: TextStyle(color: Color(0xFF455A64)),
      headline5: TextStyle(color: Color(0xFF455A64)),
      headline6: TextStyle(color: Color(0xFF455A64)),
      overline: TextStyle(color: Color(0xFF455A64)),
      subtitle2: TextStyle(color: Color(0xFF455A64)),
      button: TextStyle(color: Colors.white),
    ),
  );
}
