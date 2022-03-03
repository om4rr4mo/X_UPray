import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/pages/home_page.dart';
import 'package:prayers/pages/intro_page.dart';
import 'package:prayers/providers/languages/app_localization_delegate.dart';
import 'package:prayers/providers/notification_service.dart';
import 'package:prayers/providers/prayer_data.dart';
import 'package:prayers/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

import 'providers/languages/locale_constant.dart';

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
  runApp(UPrayApp(isFirstTime: isFirstTime, boolKey: boolKey, prefs: prefs));
}

class UPrayApp extends StatefulWidget {
  final bool isFirstTime;
  var prefs;
  final boolKey;

  UPrayApp({Key? key, required this.isFirstTime, this.prefs, this.boolKey})
      : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_UPrayAppState>();
    state!.setLocale(newLocale);
  }

  @override
  _UPrayAppState createState() => _UPrayAppState();
}

class _UPrayAppState extends State<UPrayApp> {
  final List<Locale> systemLocales = WidgetsBinding.instance!.window.locales;
  late Locale _locale = systemLocales[0];

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _locale = systemLocales[0];
    changeLanguage(context, _locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode &&
                  supportedLocale.countryCode == locale?.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          supportedLocales: [
            Locale('it', ''),
            Locale('ar', ''),
            Locale('en', ''),
            Locale('fr', ''),
          ],
          localizationsDelegates: [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: _locale,
          title: 'UPray',
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          debugShowCheckedModeBanner: false,
          home: widget.isFirstTime
              ? IntroLaunch(widget.prefs, widget.boolKey)
              : MainLaunch(),
        );
      },
    );
  }
}

class IntroLaunch extends StatelessWidget {
  final SharedPreferences prefs;
  final String boolKey;

  const IntroLaunch(this.prefs, this.boolKey, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroPage(prefs: prefs, boolKey: boolKey);
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

    return HomePage();
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
        timings!.fajr!.replaceAll(" (CET)", "").replaceAll(" (PST)", "");
    DateTime fajrDt = DateFormat('dd-MM-y HH:mm').parseStrict(fajrDate);

    String? ishaDate = pd.data![i].date!.gregorian!.date! +
        " " +
        timings.isha!.replaceAll(" (CET)", "").replaceAll(" (PST)", "");
    DateTime ishaDt = DateFormat('dd-MM-y HH:mm').parseStrict(ishaDate);

    String? maghribDate = pd.data![i].date!.gregorian!.date! +
        " " +
        timings.maghrib!.replaceAll(" (CET)", "").replaceAll(" (PST)", "");
    DateTime maghribDt = DateFormat('dd-MM-y HH:mm').parseStrict(maghribDate);

    String? asrDate = pd.data![i].date!.gregorian!.date! +
        " " +
        timings.asr!.replaceAll(" (CET)", "").replaceAll(" (PST)", "");
    DateTime asrDt = DateFormat('dd-MM-y HH:mm').parseStrict(asrDate);

    String? dhuhrDate = pd.data![i].date!.gregorian!.date! +
        " " +
        timings.dhuhr!.replaceAll(" (CET)", "").replaceAll(" (PST)", "");
    DateTime dhuhrDt = DateFormat('dd-MM-y HH:mm').parseStrict(dhuhrDate);

    tz.Location location = tz.getLocation('Europe/Rome');

    final fajrScheduledDate = tz.TZDateTime.from(fajrDt, location);
    final ishaScheduledDate = tz.TZDateTime.from(ishaDt, location);
    final maghribScheduledDate = tz.TZDateTime.from(maghribDt, location);
    final asrScheduledDate = tz.TZDateTime.from(asrDt, location);
    final dhuhrScheduledDate = tz.TZDateTime.from(dhuhrDt, location);

    NotificationService().notificationScheduled(
        notId++,
        timings.fajr!.replaceAll("(CET)", "").replaceAll(" (PST)", "") +
            " Fajr",
        "It's fajr prayer time",
        fajrDt,
        fajrScheduledDate);
    NotificationService().notificationScheduled(
        notId++,
        timings.dhuhr!.replaceAll("(CET)", "").replaceAll(" (PST)", "") +
            " Dhuhr",
        "It's dhuhr prayer time",
        dhuhrDt,
        dhuhrScheduledDate);
    NotificationService().notificationScheduled(
        notId++,
        timings.asr!.replaceAll("(CET)", "").replaceAll(" (PST)", "") + " Asr",
        "It's asr prayer time",
        asrDt,
        asrScheduledDate);
    NotificationService().notificationScheduled(
        notId++,
        timings.maghrib!.replaceAll("(CET)", "").replaceAll(" (PST)", "") +
            " Maghrib",
        "It's maghrib prayer time",
        maghribDt,
        maghribScheduledDate);
    NotificationService().notificationScheduled(
        notId++,
        timings.isha!.replaceAll("(CET)", "").replaceAll(" (PST)", "") +
            " Isha",
        "It's isha prayer time",
        ishaDt,
        ishaScheduledDate);
  }
}
