import 'dart:math';
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
DateTime currentDate = DateTime.now();

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

Color textColorForBackground(Color backgroundColor) {
  if (ThemeData.estimateBrightnessForColor(backgroundColor) ==
      Brightness.dark) {
    return const Color(0xFFFFFFFF);
  }

  return const Color(0x00000000);
}

BoxDecoration toggleBoxDecoration(BuildContext context, bool selected) {
  if (selected) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(21),
      border: Border.all(width: 2.6),
    );
  } else {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(21),
      border: Border.all(width: 2.6),
    );
  }
}

ButtonStyle toggleButtonStyle(BuildContext context, bool selected) {
  if (selected) {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21),
        ),
      ),
    );
  } else {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21),
        ),
      ),
    );
  }
}

TextStyle toggleTextStyle(
    BuildContext context, TextStyle style, bool selected) {
  return style;
}

showSlider(BuildContext context, Widget widget) {
  showModalBottomSheet<void>(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: const EdgeInsets.only(top: 16),
          height: 800,
          child: widget,
        ),
      );
    },
  );
}

late String city;
late String country;
late String address;
late int method = 3;
late int school = 0;
late prayerData.PrayerData prayerList = prayerData.PrayerData();
late quranData.QuranData quranList = quranData.QuranData();
late double pLat;
late double pLong;
bool isSigningIn = false;
late User userLogged;
PrayerProvider prayerProvider = PrayerProvider();
QuranProvider quranProvider = QuranProvider();

ShowToastError({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
  );
}

ShowToastDone({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
  );
}

ShowToastMessage({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
  );
}

int random(min, max) {
  return min + Random().nextInt(max - min);
}

LanguageEnum LangChoose = LanguageEnum.IT;

enum LanguageEnum { IT, AR, EN, FR }
