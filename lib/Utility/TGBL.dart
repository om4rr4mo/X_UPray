import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:prayers/pages/home_page.dart';
import 'package:prayers/providers/prayer_data.dart' as prayerData;
import 'package:prayers/providers/quran_data.dart' as quranData;
import 'package:prayers/providers/prayer_provider.dart';
import 'package:prayers/providers/quran_provider.dart';

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
late int school = 0;
late prayerData.PrayerData prayerList = new prayerData.PrayerData();
late quranData.QuranData quranList = new quranData.QuranData();
late double pLat;
late double pLong;
bool isSigningIn = false;
late User userLogged;
late String userUrlPhoto =
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fvectors%2Fblank-profile-picture-mystery-man-973460%2F&psig=AOvVaw0Vsqk2A0BTIydQY1pw-0pv&ust=1644594132572000&source=images&cd=vfe&ved=0CAgQjRxqFwoTCMDoztK89fUCFQAAAAAdAAAAABAE";
PrayerProvider prayerProvider = new PrayerProvider();
QuranProvider quranProvider = new QuranProvider();

ShowToastError({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

ShowToastDone({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

ShowToastMessage({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.white10,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
