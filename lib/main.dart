import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/pages/home_page.dart';
import 'package:prayers/pages/intro_page.dart';
import 'package:prayers/pages/loading_pages.dart';
import 'package:prayers/pages/tracker_page.dart';
import 'package:prayers/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  var boolKey = 'isFirstTime';
  var isFirstTime = prefs.getBool(boolKey) ?? true;

  await Firebase.initializeApp();

  runApp(isFirstTime ? IntroLaunch(prefs, boolKey) : MainLaunch());
}

class IntroLaunch extends StatelessWidget {
  final SharedPreferences prefs;
  final String boolKey;

  IntroLaunch(this.prefs, this.boolKey);

  Widget build(BuildContext context) {
    prefs.setBool(boolKey, false);

    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'UPray',
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            debugShowCheckedModeBanner: false,
            home: IntroPage(),
          );
        });
  }
}

class MainLaunch extends StatelessWidget {
  const MainLaunch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null)
        loggedIn = false;
      else {
        loggedIn = true;
        userLogged = user;
      }
    });

    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'UPray',
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        });
  }
}
