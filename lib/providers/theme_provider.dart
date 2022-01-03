import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  ThemeData get theme => themeMode == ThemeMode.dark ? MyTheme.darkTheme : MyTheme.lightTheme;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyTheme {
  static final darkTheme = ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    scaffoldBackgroundColor: Color(0xFF005005),
    primaryColor: Colors.lightGreen,
    colorScheme: ColorScheme.dark(),
    fontFamily: 'Montserrat',
    iconTheme: IconThemeData(
      color: Colors.green[50],
    ),
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.white),
      bodyText1: TextStyle(color: Colors.white),
      subtitle1: TextStyle(color: Colors.white),
      button: TextStyle(color: Colors.black),
    ),
  );

  static final lightTheme = ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Color(0xFFB2DFDB),
    colorScheme: ColorScheme.light(),
    fontFamily: 'Montserrat',
    iconTheme: IconThemeData(
      color: Color(0xFF82ADA9),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.black),
      bodyText1: TextStyle(color: Colors.black),
      subtitle1: TextStyle(color: Colors.black),
      button: TextStyle(color: Colors.white),
    ),
  );
}
