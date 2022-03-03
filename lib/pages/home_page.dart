import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prayers/pages/prayers_page.dart';
import 'package:prayers/pages/qibla_page.dart';
import 'package:prayers/pages/tracker_page.dart';
import 'package:prayers/providers/languages/languages.dart';

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
  var currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

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

  static List<Widget> pages = <Widget>[
    const PrayersPage(),
    const QiblaPage(),
    const TrackerPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Languages? languages = Languages.of(context);
    return Scaffold(
      bottomNavigationBar: HomeNavigationBar(
        onItemTap: _onItemTapped,
        destinations: [
          /// Orario
          NavigationDestination(
            icon: Icon(FontAwesomeIcons.clock),
            selectedIcon: Icon(FontAwesomeIcons.solidClock),
            label: languages!.homeNavbarPrayer,
          ),

          /// Qibla
          NavigationDestination(
            icon: Icon(FontAwesomeIcons.compass),
            selectedIcon: Icon(FontAwesomeIcons.solidCompass),
            label: languages!.homeNavbarQibla,
          ),

          /// Tracker
          NavigationDestination(
            icon: Icon(FontAwesomeIcons.calendarCheck),
            selectedIcon: Icon(FontAwesomeIcons.solidCalendarCheck),
            label: languages!.homeNavbarTracker,
          ),
        ],
      ),
      body: Center(
        child: pages.elementAt(currentIndex),
      ),
    );
  }
}
