import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  ThemeMode get getTheme => themeMode;

  void toggleTheme(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }
}

class MyTheme {
  static final seed = Color(0xFF009688);

  static final lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF006A5F),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF74F7E5),
    onPrimaryContainer: Color(0xFF00201C),
    secondary: Color(0xFF4A635F),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFCDE8E2),
    onSecondaryContainer: Color(0xFF05201C),
    tertiary: Color(0xFF466179),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFCBE5FF),
    onTertiaryContainer: Color(0xFF001D31),
    error: Color(0xFFBA1B1B),
    errorContainer: Color(0xFFFFDAD4),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410001),
    background: Color(0xFFFAFDFA),
    onBackground: Color(0xFF191C1B),
    surface: Color(0xFFFAFDFA),
    onSurface: Color(0xFF191C1B),
    surfaceVariant: Color(0xFFDBE5E2),
    onSurfaceVariant: Color(0xFF3F4947),
    outline: Color(0xFF6E7976),
    onInverseSurface: Color(0xFFEFF1EF),
    inverseSurface: Color(0xFF2D3130),
    inversePrimary: Color(0xFF53DBC9),
    shadow: Color(0xFF000000),
  );

  static final darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF53DBC9),
    onPrimary: Color(0xFF003730),
    primaryContainer: Color(0xFF005047),
    onPrimaryContainer: Color(0xFF74F7E5),
    secondary: Color(0xFFB1CCC6),
    onSecondary: Color(0xFF1C3531),
    secondaryContainer: Color(0xFF334B47),
    onSecondaryContainer: Color(0xFFCDE8E2),
    tertiary: Color(0xFFADCAE6),
    onTertiary: Color(0xFF153349),
    tertiaryContainer: Color(0xFF2D4960),
    onTertiaryContainer: Color(0xFFCBE5FF),
    error: Color(0xFFFFB4A9),
    errorContainer: Color(0xFF930006),
    onError: Color(0xFF680003),
    onErrorContainer: Color(0xFFFFDAD4),
    background: Color(0xFF191C1B),
    onBackground: Color(0xFFE0E3E1),
    surface: Color(0xFF191C1B),
    onSurface: Color(0xFFE0E3E1),
    surfaceVariant: Color(0xFF3F4947),
    onSurfaceVariant: Color(0xFFBFC9C6),
    outline: Color(0xFF889390),
    onInverseSurface: Color(0xFF191C1B),
    inverseSurface: Color(0xFFE0E3E1),
    inversePrimary: Color(0xFF006A5F),
    shadow: Color(0xFF000000),
  );

  static final darkTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    // dividerColor: Colors.blue[600],
    // scaffoldBackgroundColor: const Color(0xFF041C38),
    // primaryColor: const Color(0xFF041C38),
    // unselectedWidgetColor: Color(0xFF726D78),
    // selectedRowColor: Color(0xFFF2F1EB),
    // shadowColor: Color(0xFF041C38),
    colorScheme: darkColorScheme,
    fontFamily: 'Montserrat',
    // iconTheme: IconThemeData(
    //   color: Color(0xFF4474C4),
    // ),
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
    // dividerColor: Colors.teal[300],
    // scaffoldBackgroundColor: Colors.teal[50],
    // primaryColor: Colors.teal[50],
    // unselectedWidgetColor: Colors.blueGrey,
    // selectedRowColor: Colors.teal,
    // shadowColor: Colors.teal[900],
    colorScheme: lightColorScheme,
    fontFamily: 'Montserrat',
    // iconTheme: const IconThemeData(
    //   color: Colors.teal,
    // ),
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
