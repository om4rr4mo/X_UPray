import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/providers/prayer_provider.dart';

import 'package:prayers/components/navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer timer;
  late String timeRemain = "";
  late String nextPrayer = "";
  late PrayerTimes prayerTimes;
  late final params;
  late final myCoordinates;

  String timeBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day, from.hour, from.minute, from.second);
    to = DateTime(to.year, to.month, to.day, to.hour, to.minute, to.second);
    return to.difference(from).inHours.toString().padLeft(2, '0') + ":" + (to.difference(from).inMinutes % 60).toString().padLeft(2, '0') + ":" + (to.difference(from).inSeconds % 60).toString().padLeft(2, '0');
  }

  String fetchPatientCount() {
    Prayer p = prayerTimes.nextPrayer();
    DateTime d = DateTime.now().add(const Duration(days: 1));
    d = DateTime(d.year, d.month, d.day, 0, 0, 0);

    if (p == Prayer.none) {
      p = prayerTimes.nextPrayerByDateTime(d);
    }
    String s = timeBetween(DateTime.now(), prayerTimes.timeForPrayer(prayerTimes.nextPrayerByDateTime(DateTime.now())));
    return s;
  }

  @override
  void initState() {
    super.initState();
    myCoordinates = Coordinates(45.497386, 10.223677);
    params = CalculationMethod.muslim_world_league.getParameters();
    params.madhab = Madhab.hanafi;
    prayerTimes = PrayerTimes.today(myCoordinates, params);

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        Prayer xx = Prayer.values.toList().firstWhere((element) => element.index == prayerTimes.nextPrayer().index);
        nextPrayer = xx.toString().split('.')[1];
        timeRemain = fetchPatientCount();
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      bottomNavigationBar: const HomeNavigationBar(),
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              nextPrayer.toCapitalized(),
              textAlign: TextAlign.center,
            ),
            Text(
              timeRemain,
              textAlign: TextAlign.center,
            ),
            PrayerProvider(
              prayerName: "Fajr",
              prayerTime: prayerTimes.fajr.hour.toString().padLeft(2, '0') + ":" + prayerTimes.fajr.minute.toString().padLeft(2, '0'),
            ),
            PrayerProvider(
              prayerName: "Sunrise",
              prayerTime: prayerTimes.sunrise.hour.toString().padLeft(2, '0') + ":" + prayerTimes.sunrise.minute.toString().padLeft(2, '0'),
            ),
            PrayerProvider(
              prayerName: "Dhuhr",
              prayerTime: prayerTimes.dhuhr.hour.toString().padLeft(2, '0') + ":" + prayerTimes.dhuhr.minute.toString().padLeft(2, '0'),
            ),
            PrayerProvider(
              prayerName: "Asr",
              prayerTime: prayerTimes.asr.hour.toString().padLeft(2, '0') + ":" + prayerTimes.asr.minute.toString().padLeft(2, '0'),
            ),
            PrayerProvider(
              prayerName: "Maghrib",
              prayerTime: prayerTimes.maghrib.hour.toString() + ":" + prayerTimes.maghrib.minute.toString().padLeft(2, '0'),
            ),
            PrayerProvider(
              prayerName: "Isha'",
              prayerTime: prayerTimes.isha.hour.toString().padLeft(2, '0') + ":" + prayerTimes.isha.minute.toString().padLeft(2, '0'),
            ),
          ],
        )),
      ),
    );
  }
}
