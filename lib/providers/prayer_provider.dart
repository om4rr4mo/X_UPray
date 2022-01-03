import 'package:flutter/material.dart';

class PrayerProvider extends StatelessWidget {
  final String prayerName;
  final String prayerTime;

  const PrayerProvider(
      {Key? key, required this.prayerName, required this.prayerTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(prayerTime),
        Text(prayerName),
      ],
    );
  }
}
