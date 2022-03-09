import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/pages/prayers_page.dart';
import 'package:prayers/pages/qibla_page.dart';
import 'package:prayers/pages/tracker_page.dart';
import 'package:prayers/providers/languages/languages.dart';
import 'package:prayers/providers/prayer_data.dart';

import '../components/navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String timeRemain = "";
  late String nextPrayer = "";
  var currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    CustomData cd = PrayerList[DateTime.now().day - 1];
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
            label: languages.homeNavbarQibla,
          ),

          /// Tracker
          NavigationDestination(
            icon: Icon(FontAwesomeIcons.calendarCheck),
            selectedIcon: Icon(FontAwesomeIcons.solidCalendarCheck),
            label: languages.homeNavbarTracker,
          ),
        ],
      ),
      body: Center(
        child: pages.elementAt(currentIndex),
      ),
    );
  }
}
