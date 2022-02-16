import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    PrayersPage(),
    //QuranPage(),
    QiblaPage(),
    TrackerPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HomeNavigationBar(
        onItemTap: _onItemTapped,
        destinations: [
          ///Orari preghiera
          NavigationDestination(
            icon: const Icon(FontAwesomeIcons.clock),
            label: "Preghiere",
          ),

          /// Corano
//BottomNavigationBarItem(icon: const Icon(FontAwesomeIcons.book), label: "Corano"),
          /// Qibla
          NavigationDestination(
            icon: Icon(FontAwesomeIcons.compass),
            label: "Qibla",
          ),

          /// Tracker
          NavigationDestination(
            icon: const Icon(FontAwesomeIcons.solidCalendarCheck),
            label: "Tracker",
          ),

          /// Impostazioni
          NavigationDestination(
            icon: const Icon(FontAwesomeIcons.slidersH),
            label: "Impostazioni",
          ),
        ],
      ),
      // BottomNavigationBar(
      //   showUnselectedLabels: true,
      //   unselectedItemColor: Theme.of(context).unselectedWidgetColor,
      //   backgroundColor:  Colors.white10,
      //   selectedItemColor: Theme.of(context).selectedRowColor,
      //   items: [
      //     ///Orari preghiera
      //     BottomNavigationBarItem(
      //       icon: const Icon(FontAwesomeIcons.clock),
      //       label: "Preghiere",
      //     ),
      //
      //     /// Corano
      //     //BottomNavigationBarItem(icon: const Icon(FontAwesomeIcons.book), label: "Corano"),
      //
      //     /// Qibla
      //     BottomNavigationBarItem(
      //       icon: Icon(FontAwesomeIcons.compass),
      //       label: "Qibla",
      //     ),
      //
      //     /// Tracker
      //     BottomNavigationBarItem(
      //       icon: const Icon(FontAwesomeIcons.solidCalendarCheck),
      //       label: "Tracker",
      //     ),
      //
      //     /// Impostazioni
      //     BottomNavigationBarItem(
      //       icon: const Icon(FontAwesomeIcons.slidersH),
      //       label: "Impostazioni",
      //     ),
      //   ],
      //   currentIndex: currentIndex,
      //   onTap: _onItemTapped,
      // ),
      resizeToAvoidBottomInset: false,
      extendBody: false,
      body: Center(
        child: pages.elementAt(currentIndex),
      ),
    );
  }
}
