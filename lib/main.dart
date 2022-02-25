import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/pages/home_page.dart';
import 'package:prayers/pages/intro_page.dart';
import 'package:prayers/providers/notification_service.dart';
import 'package:prayers/providers/prayer_data.dart';
import 'package:prayers/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  var boolKey = 'isFirstTime';
  var isFirstTime = prefs.getBool(boolKey) ?? true;

  loadDefaultData().then((rawData) {
    initializeDatabase(rawData);
    var italy = getLocation('Europe/Rome');
    print(italy);
  });
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

Future<List<int>> loadDefaultData() async {
  var byteData = await rootBundle.load('packages/timezone/data/2020a.tzf');
  return byteData.buffer.asUint8List();
}

ScheduleNotification() async {
  PrayerData pd = await prayerProvider.getPTCalendar();

  int numDay = DateTime.now().day;
  int notId = 0;
  NotificationService().flutterLocalNotificationsPlugin.cancelAll();

  for (int i = numDay - 1; i < numDay + 2; i++) {
    Timings? timings = pd.data![i].timings;

    String? fajrDate = pd.data![i].date!.gregorian!.date! +
        " " +
        timings!.fajr!.replaceAll(" (CET)", "");
    DateTime fajrDt = DateFormat('dd-MM-y HH:mm').parseStrict(fajrDate);

    String? ishaDate = pd.data![i].date!.gregorian!.date! +
        " " +
        timings.isha!.replaceAll(" (CET)", "");
    DateTime ishaDt = DateFormat('dd-MM-y HH:mm').parseStrict(ishaDate);

    String? maghribDate = pd.data![i].date!.gregorian!.date! +
        " " +
        timings.maghrib!.replaceAll(" (CET)", "");
    DateTime maghribDt = DateFormat('dd-MM-y HH:mm').parseStrict(maghribDate);

    String? asrDate = pd.data![i].date!.gregorian!.date! +
        " " +
        timings.asr!.replaceAll(" (CET)", "");
    DateTime asrDt = DateFormat('dd-MM-y HH:mm').parseStrict(asrDate);

    String? dhuhrDate = pd.data![i].date!.gregorian!.date! +
        " " +
        timings.dhuhr!.replaceAll(" (CET)", "");
    DateTime dhuhrDt = DateFormat('dd-MM-y HH:mm').parseStrict(dhuhrDate);

    tz.Location location = tz.getLocation('Europe/Rome');

    final fajrScheduledDate = tz.TZDateTime.from(fajrDt, location);
    final ishaScheduledDate = tz.TZDateTime.from(ishaDt, location);
    final maghribScheduledDate = tz.TZDateTime.from(maghribDt, location);
    final asrScheduledDate = tz.TZDateTime.from(asrDt, location);
    final dhuhrScheduledDate = tz.TZDateTime.from(dhuhrDt, location);

    NotificationService().notificationScheduled(
        notId++,
        timings.fajr!.replaceAll("(CET)", "") + " Fajr",
        "It's fajr prayer time",
        fajrDt,
        fajrScheduledDate);
    NotificationService().notificationScheduled(
        notId++,
        timings.dhuhr!.replaceAll("(CET)", "") + " Dhuhr",
        "It's dhuhr prayer time",
        dhuhrDt,
        dhuhrScheduledDate);
    NotificationService().notificationScheduled(
        notId++,
        timings.asr!.replaceAll("(CET)", "") + " Asr",
        "It's asr prayer time",
        asrDt,
        asrScheduledDate);
    NotificationService().notificationScheduled(
        notId++,
        timings.maghrib!.replaceAll("(CET)", "") + " Maghrib",
        "It's maghrib prayer time",
        maghribDt,
        maghribScheduledDate);
    NotificationService().notificationScheduled(
        notId++,
        timings.isha!.replaceAll("(CET)", "") + " Isha",
        "It's isha prayer time",
        ishaDt,
        ishaScheduledDate);
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
