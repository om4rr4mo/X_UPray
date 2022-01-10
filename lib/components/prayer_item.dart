import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PrayerItem extends StatelessWidget {
  final String prayerName;
  final String prayerTime;

  const PrayerItem(
      {Key? key, required this.prayerName, required this.prayerTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime parseDate = new DateFormat("HH:mm").parse(prayerTime);
    String formattedPrayerTime = DateFormat('kk:mm').format(parseDate);
    
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        children: [
          Text(
            formattedPrayerTime,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Text(prayerName),
        ],
      ),
    );
  }
}
