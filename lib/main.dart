import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/pages/home_page.dart';
import 'package:prayers/pages/intro_page.dart';
import 'package:prayers/providers/notification_service.dart';
import 'package:prayers/providers/prayer_data.dart';
import 'package:prayers/providers/theme_provider.dart';
import 'package:prayers/providers/timezone.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  var boolKey = 'isFirstTime';
  var isFirstTime = prefs.getBool(boolKey) ?? true;

  await Firebase.initializeApp();
  await NotificationService().init();
  runApp(isFirstTime ? IntroLaunch(prefs, boolKey) : const MainLaunch());
}

class IntroLaunch extends StatelessWidget {
  final SharedPreferences prefs;
  final String boolKey;

  const IntroLaunch(this.prefs, this.boolKey, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            home: IntroPage(prefs: prefs, boolKey: boolKey),
          );
        });
  }
}

ScheduleNotification() async {
  PrayerData pd = await prayerProvider.getPTCalendar();

  int numDay = DateTime.now().day;

  NotificationService().flutterLocalNotificationsPlugin.cancelAll();

  for (int i = numDay; i < numDay + 5; i++) {
    Timings? timings = pd.data![i].timings;
    String? date = pd.data![i].date?.gregorian?.date;
    DateTime dt = DateFormat('dd-MM-y').parseStrict(date!);
    final timeZone = TimeZone();
    // Device's timezone.
    String timeZoneName = await timeZone.getTimeZoneName();
    // Current location
    final location = await timeZone.getLocation(timeZoneName);

    final scheduledDate = tz.TZDateTime.from(dt, location);
  }
}

class MainLaunch extends StatelessWidget {
  const MainLaunch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScheduleNotification();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        loggedIn = false;
      } else {
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
            home: const HomePage(),
          );
        });
  }
}
