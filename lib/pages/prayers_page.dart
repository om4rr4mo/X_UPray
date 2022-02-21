import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/components/prayer_item.dart';
import 'package:prayers/providers/prayer_data.dart';
import '../providers/notification_service.dart';
import 'loading_pages.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PrayersPage extends StatefulWidget {
  const PrayersPage({Key? key}) : super(key: key);

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

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != currentDate)
      setState(() {
        currentDate = picked;
      });
    date = DateFormat('dd-MM-y').format(currentDate);
    prayerProvider.getTimings(date);
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
                                currentDate = currentDate.subtract(Duration(days: 1));
                              });
                            },
                            child: Icon(
                              FontAwesomeIcons.arrowLeft,
                              size: 30,
                            ),
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _selectDate(context);
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      "${currentDate.toLocal()}".split(' ')[0],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      data.date.hijri.date,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
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
                                currentDate = currentDate.add(Duration(days: 1));
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
                        prayerName: "Maghrib",
                        prayerTime: data.timings.maghrib,
                      ),
                      PrayerItem(
                        prayerName: "Isha",
                        prayerTime: data.timings.isha,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(
                child: Container(
              height: 0,
              width: 0,
            ));
          }
        });
  }
}
