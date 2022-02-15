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

  @override
  void initState() {
    super.initState();
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
