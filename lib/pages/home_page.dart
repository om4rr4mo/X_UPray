import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/components/loading_bar.dart';
import 'package:prayers/components/prayer_item.dart';
import 'package:prayers/pages/prayers_page.dart';
import 'package:prayers/pages/qibla_page.dart';
import 'package:prayers/pages/settings_page.dart';
import 'package:prayers/pages/tracker_page.dart';
import 'package:prayers/providers/prayer_provider.dart';

import '../components/navigation_bar.dart';
import 'loading_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer timer;
  late String timeRemain = "";
  late String nextPrayer = "";
  late PageController pageController = new PageController();
  var currentIndex = 0;
  final PrayerProvider prayerProvider = new PrayerProvider();

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

  // String fetchPatientCount() {
  //   Prayer p = prayerTimes.nextPrayer();
  //   DateTime d = DateTime.now().add(new Duration(days: 1));
  //   d = new DateTime(d.year, d.month, d.day, 0, 0, 0);
  //   String s = "";
  //
  //   if (p != Prayer.none) {
  //     p = prayerTimes.nextPrayerByDateTime(d);
  //     s = timeBetween(DateTime.now(), prayerTimes.timeForPrayer(prayerTimes.nextPrayerByDateTime(DateTime.now())));
  //   }
  //   return s;
  // }

  @override
  void initState() {
    super.initState();

    // timer = Timer.periodic(Duration(seconds: 1), (_) {
    //   setState(() {
    //     Prayer xx = Prayer.values.toList().firstWhere((element) => element.index == prayerTimes.nextPrayer().index);
    //
    //     if (xx != null) {
    //       nextPrayer = xx.toString().split('.')[1];
    //     }
    //     timeRemain = fetchPatientCount();
    //   });
    // });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: prayerProvider.getPTCalendar(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data.data[currentDate.day - 1];
            return Scaffold(
              bottomNavigationBar: HomeNavigationBar(
                pageController: pageController,
              ),
              body: SafeArea(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                    PrayersPage(data),
                    QiblaPage(),
                    TrackerPage(),
                    SettingsPage()
                  ],
                ),
              ),
            );
          } else {
            return Center(child: LoadingPage());
          }
        });
  }
}
