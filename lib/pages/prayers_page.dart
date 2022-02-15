import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/components/prayer_item.dart';
import 'loading_pages.dart';

class PrayersPage extends StatefulWidget {
  @override
  State<PrayersPage> createState() => _PrayersPageState();
}

class _PrayersPageState extends State<PrayersPage> {
  late String date;

  @override
  void initState() {
    super.initState();

    date = DateFormat('dd-MM-y').format(currentDate);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: prayerProvider.getTimings(date),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var data;

            if (snapshot.data.data.length > 1)
              data = snapshot.data.data[currentDate.day - 1];
            else
              data = snapshot.data.data[0];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                DateTime d =
                                    DateFormat('dd-MM-y').parseStrict(date);
                                d = d.subtract(Duration(days: 1));
                                date = DateFormat('dd-MM-y').format(d);
                              });
                            },
                            child: Icon(
                              FontAwesomeIcons.arrowLeft,
                              size: 30,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                data.date.hijri.date,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                data.date.readable,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                DateTime d =
                                    DateFormat('dd-MM-y').parseStrict(date);
                                d = d.add(Duration(days: 1));
                                date = DateFormat('dd-MM-y').format(d);
                              });
                            },
                            child: Icon(
                              FontAwesomeIcons.arrowRight,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "",
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
                        prayerName: "Maghreb",
                        prayerTime: data.timings.maghrib,
                      ),
                      PrayerItem(
                        prayerName: "Ishaa",
                        prayerTime: data.timings.isha,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(child: LoadingPage());
          }
        });
  }
}
