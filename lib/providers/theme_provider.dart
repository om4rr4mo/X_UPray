import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  ThemeMode get getTheme => themeMode;

  void toggleTheme(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }
}

class MyTheme {
  static const seed = Color(0xFF008080);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF006A6A),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF6EF6F6),
    onPrimaryContainer: Color(0xFF002020),
    secondary: Color(0xFF4A6363),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFCCE8E7),
    onSecondaryContainer: Color(0xFF041F1F),
    tertiary: Color(0xFF4B607C),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFD2E4FF),
    onTertiaryContainer: Color(0xFF041C35),
    error: Color(0xFFBA1B1B),
    errorContainer: Color(0xFFFFDAD4),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410001),
    background: Color(0xFFFAFDFC),
    onBackground: Color(0xFF191C1C),
    surface: Color(0xFFFAFDFC),
    onSurface: Color(0xFF191C1C),
    surfaceVariant: Color(0xFFDAE5E4),
    onSurfaceVariant: Color(0xFF3F4848),
    outline: Color(0xFF6F7978),
    onInverseSurface: Color(0xFFEFF1F0),
    inverseSurface: Color(0xFF2D3131),
    inversePrimary: Color(0xFF4DDADA),
    shadow: Color(0xFF000000),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF4DDADA),
    onPrimary: Color(0xFF003738),
    primaryContainer: Color(0xFF004F50),
    onPrimaryContainer: Color(0xFF6EF6F6),
    secondary: Color(0xFFB0CCCB),
    onSecondary: Color(0xFF1B3534),
    secondaryContainer: Color(0xFF324B4B),
    onSecondaryContainer: Color(0xFFCCE8E7),
    tertiary: Color(0xFFB3C8E8),
    onTertiary: Color(0xFF1C314B),
    tertiaryContainer: Color(0xFF334863),
    onTertiaryContainer: Color(0xFFD2E4FF),
    error: Color(0xFFFFB4A9),
    errorContainer: Color(0xFF930006),
    onError: Color(0xFF680003),
    onErrorContainer: Color(0xFFFFDAD4),
    background: Color(0xFF191C1C),
    onBackground: Color(0xFFE0E3E2),
    surface: Color(0xFF191C1C),
    onSurface: Color(0xFFE0E3E2),
    surfaceVariant: Color(0xFF3F4848),
    onSurfaceVariant: Color(0xFFBEC9C8),
    outline: Color(0xFF889392),
    onInverseSurface: Color(0xFF191C1C),
    inverseSurface: Color(0xFFE0E3E2),
    inversePrimary: Color(0xFF006A6A),
    shadow: Color(0xFF000000),
  );

  static final lightTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    colorScheme: lightColorScheme,
    fontFamily: 'Montserrat',
    textTheme: const TextTheme(
      headline1: TextStyle(color: Color(0xFF4A6363)),
      headline2: TextStyle(color: Color(0xFF4A6363)),
      headline3: TextStyle(color: Color(0xFF4A6363)),
      headline4: TextStyle(color: Color(0xFF4A6363)),
      headline5: TextStyle(color: Color(0xFF4A6363)),
      headline6: TextStyle(color: Color(0xFF4A6363)),
      bodyText1: TextStyle(color: Color(0xFF4A6363)),
      bodyText2: TextStyle(color: Color(0xFF4A6363)),
      subtitle1: TextStyle(color: Color(0xFF4A6363)),
      subtitle2: TextStyle(color: Color(0xFF4A6363)),
      caption: TextStyle(color: Color(0xFF4A6363)),
      overline: TextStyle(color: Color(0xFF4A6363)),
      button: TextStyle(color: Color(0xFF4A6363)),
    ),
  );

  static final darkTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    colorScheme: darkColorScheme,
    fontFamily: 'Montserrat',
    textTheme: const TextTheme(
      headline1: TextStyle(color: Color(0xFFFAFDFC)),
      headline2: TextStyle(color: Color(0xFFFAFDFC)),
      headline3: TextStyle(color: Color(0xFFFAFDFC)),
      headline4: TextStyle(color: Color(0xFFFAFDFC)),
      headline5: TextStyle(color: Color(0xFFFAFDFC)),
      headline6: TextStyle(color: Color(0xFFFAFDFC)),
      bodyText1: TextStyle(color: Color(0xFFFAFDFC)),
      bodyText2: TextStyle(color: Color(0xFFFAFDFC)),
      subtitle1: TextStyle(color: Color(0xFFFAFDFC)),
      subtitle2: TextStyle(color: Color(0xFFFAFDFC)),
      caption: TextStyle(color: Color(0xFFFAFDFC)),
      overline: TextStyle(color: Color(0xFFFAFDFC)),
      button: TextStyle(color: Color(0xFFFAFDFC)),
    ),
  );
}
