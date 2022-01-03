import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/providers/prayer_provider.dart';

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
    from = DateTime(
        from.year, from.month, from.day, from.hour, from.minute, from.second);
    to = DateTime(to.year, to.month, to.day, to.hour, to.minute, to.second);
    return to.difference(from).inHours.toString().padLeft(2, '0') +
        ":" +
        (to.difference(from).inMinutes % 60).toString().padLeft(2, '0') +
        ":" +
        (to.difference(from).inSeconds % 60).toString().padLeft(2, '0');
  }

  String fetchPatientCount() {
    String s = timeBetween(
        DateTime.now(), prayerTimes.timeForPrayer(prayerTimes.nextPrayer()));
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
        Prayer xx = Prayer.values.toList().firstWhere((element) =>
            element.index == prayerTimes.nextPrayer().index);
        if (xx != null) {
          nextPrayer = xx.toString().split('.')[1];
        }
        timeRemain = fetchPatientCount();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              prayerTime: prayerTimes.fajr.hour.toString() +
                  ":" +
                  prayerTimes.fajr.minute.toString(),
            ),
            PrayerProvider(
              prayerName: "Sunrise",
              prayerTime: prayerTimes.sunrise.hour.toString() +
                  ":" +
                  prayerTimes.sunrise.minute.toString(),
            ),
            PrayerProvider(
              prayerName: "Dhuhr",
              prayerTime: prayerTimes.dhuhr.hour.toString() +
                  ":" +
                  prayerTimes.dhuhr.minute.toString(),
            ),
            PrayerProvider(
              prayerName: "Asr",
              prayerTime: prayerTimes.asr.hour.toString() +
                  ":" +
                  prayerTimes.asr.minute.toString(),
            ),
            PrayerProvider(
              prayerName: "Maghreb",
              prayerTime: prayerTimes.maghrib.hour.toString() +
                  ":" +
                  prayerTimes.maghrib.minute.toString(),
            ),
            PrayerProvider(
              prayerName: "Ishaa",
              prayerTime: prayerTimes.isha.hour.toString() +
                  ":" +
                  prayerTimes.isha.minute.toString(),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        )),
      ),
    );
  }
}
