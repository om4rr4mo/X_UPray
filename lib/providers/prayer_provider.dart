import 'package:flutter/material.dart';

class PrayerProvider extends StatelessWidget {
  final String prayerName;
  final String prayerTime;

  const PrayerProvider(
      {Key? key, required this.prayerName, required this.prayerTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(prayerTime, style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),),
          Text(prayerName),
        ],
      ),
    );
  }
}
