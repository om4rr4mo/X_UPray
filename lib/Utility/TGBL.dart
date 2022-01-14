import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:prayers/pages/home_page.dart';
import 'package:prayers/providers/prayer_data.dart' as prayerData;
import 'package:prayers/providers/prayer_provider.dart';

final Geolocator geolocatorPlatform = Geolocator();
final currentDate = DateTime.now();

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

Route createRoute(BuildContext context) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

bool loggedIn = false;
bool isLocationEnabled = false;
bool isNotificationEnabled = false;

var users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

enum ThemeEnum { LIGHT, DARK, SYSTEM }

BoxDecoration selectedBoxDecoration(BuildContext context) {
  return BoxDecoration(
    color: Theme.of(context).iconTheme.color,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: Theme.of(context).iconTheme.color!, width: 4),
  );
}

BoxDecoration unselectedBoxDecoration(BuildContext context) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border:
        Border.all(color: Theme.of(context).unselectedWidgetColor, width: 2),
  );
}

late String city;
late String country;
late String address;
late int method = 3;
late int school = 1;
late prayerData.PrayerData list = new prayerData.PrayerData();
late double pLat;
late double pLong;

PrayerProvider prayerProvider = new PrayerProvider();
