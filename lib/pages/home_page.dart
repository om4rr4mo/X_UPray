import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/providers/prayer_provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../components/navigation_bar.dart';

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
  var _currentIndex = 0;

  String timeBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day, from.hour, from.minute, from.second);
    to = DateTime(to.year, to.month, to.day, to.hour, to.minute, to.second);
    return to.difference(from).inHours.toString().padLeft(2, '0') + ":" + (to.difference(from).inMinutes % 60).toString().padLeft(2, '0') + ":" + (to.difference(from).inSeconds % 60).toString().padLeft(2, '0');
  }

  String fetchPatientCount() {
    Prayer p = prayerTimes.nextPrayer();
    DateTime d = DateTime.now().add(new Duration(days: 1));
    d = new DateTime(d.year, d.month, d.day, 0, 0, 0);

    if (p == Prayer.none)
      p = prayerTimes.nextPrayerByDateTime(d);
    String s = timeBetween(DateTime.now(), prayerTimes.timeForPrayer(prayerTimes.nextPrayerByDateTime(DateTime.now())));
    return s;
  }

  @override
  void initState() {
    super.initState();
    myCoordinates = Coordinates(45.497386, 10.223677);
    params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;
    prayerTimes = PrayerTimes.today(myCoordinates, params);

    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        Prayer xx = Prayer.values.toList().firstWhere((element) => element.index == prayerTimes.nextPrayer().index);
        if (xx != null) {
          nextPrayer = xx.toString().split('.')[1];
        }
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
      bottomNavigationBar: HomeNavigationBar(),
      body: SafeArea(
        child: Container(
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
                prayerName: "Maghreb",
                prayerTime: prayerTimes.maghrib.hour.toString() + ":" + prayerTimes.maghrib.minute.toString().padLeft(2, '0'),
              ),
              PrayerProvider(
                prayerName: "Ishaa",
                prayerTime: prayerTimes.isha.hour.toString().padLeft(2, '0') + ":" + prayerTimes.isha.minute.toString().padLeft(2, '0'),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
