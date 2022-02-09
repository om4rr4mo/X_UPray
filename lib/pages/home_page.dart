import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:prayers/pages/prayers_page.dart';
import 'package:prayers/pages/qibla_page.dart';
import 'package:prayers/pages/quran_pages.dart';
import 'package:prayers/pages/settings_page.dart';
import 'package:prayers/pages/tracker_page.dart';

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
  late PageController pageController = new PageController();
  var currentIndex = 0;

  // final PermissionHandler permissionHandler = PermissionHandler();
  // late Map<PermissionGroup, PermissionStatus> permissions;

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

  // Future<bool> _requestPermission(PermissionGroup permission) async {
  //   final PermissionHandler _permissionHandler = PermissionHandler();
  //   var result = await _permissionHandler.requestPermissions([permission]);
  //   if (result[permission] == PermissionStatus.granted) {
  //     return true;
  //   }
  //   return false;
  // }
  //
  // /*Checking if your App has been Given Permission*/
  // Future<bool> requestLocationPermission({Function? onPermissionDenied}) async {
  //   var granted = await _requestPermission(PermissionGroup.location);
  //   if (granted != true) {
  //     requestLocationPermission();
  //   }
  //   debugPrint('requestContactsPermission $granted');
  //   return granted;
  // }


  @override
  void initState() {
    super.initState();

    //requestLocationPermission();
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: false,
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                PrayersPage(),
                QuranPage(),
                QiblaPage(),
                TrackerPage(),
                SettingsPage(),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                //color: Colors.white10,
                child: HomeNavigationBar(
                  pageController: pageController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
