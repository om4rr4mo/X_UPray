import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:prayers/pages/home_page.dart';
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

Future<bool> locationEnabled() async {
  bool serviceEnabled;

  // Test if location services are enabled.
  serviceEnabled = await geolocatorPlatform.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return false;
  }

  return true;
}

Future<bool> handlePermission() async {
  // LocationPermission permission;
  //
  // permission = await geolocatorPlatform.checkPermission();
  // if (permission == LocationPermission.denied) {
  //   permission = await geolocatorPlatform.requestPermission();
  //   if (permission == LocationPermission.denied) {
  //
  //     return false;
  //   }
  // }
  //
  // if (permission == LocationPermission.deniedForever) {
  //   return false;
  // }

  return true;
}

bool loggedIn = false;
bool isLocationEnabled = false;
bool isNotificationEnabled = false;

var users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};