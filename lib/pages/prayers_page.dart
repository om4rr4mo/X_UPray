import 'package:flutter/material.dart';
import 'package:prayers/components/prayer_item.dart';

class PrayersPage extends StatelessWidget {
  final data;

  const PrayersPage(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "",
              //nextPrayer.toCapitalized(),
              textAlign: TextAlign.center,
            ),
            Text(
              data.date.hijri.date,
              textAlign: TextAlign.center,
            ),
            Text(
              data.date.readable,
              textAlign: TextAlign.center,
            ),
            PrayerItem(
              prayerName: "Fajr",
              prayerTime: data.timings.fajr,
            ),
            PrayerItem(
              prayerName: "Sunrise",
              prayerTime: data.timings.sunrise,
            ),
            PrayerItem(
              prayerName: "Dhuhr",
              prayerTime: data.timings.dhuhr,
            ),
            PrayerItem(
              prayerName: "Asr",
              prayerTime: data.timings.asr,
            ),
            PrayerItem(
              prayerName: "Sunset",
              prayerTime: data.timings.sunset,
            ),
            PrayerItem(
              prayerName: "Maghreb",
              prayerTime: data.timings.maghrib,
            ),
            PrayerItem(
              prayerName: "Ishaa",
              prayerTime: data.timings.isha,
            ),
            PrayerItem(
              prayerName: "Imsak",
              prayerTime: data.timings.imsak,
            ),
          ],
        ),
      ),
    );
  }
}
