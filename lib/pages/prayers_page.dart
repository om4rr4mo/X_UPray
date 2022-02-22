import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/components/prayer_item.dart';
import 'package:prayers/pages/settings_page.dart';

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
    if (picked != null && picked != currentDate) {
      setState(() {
        currentDate = picked;
      });
    }
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

            if (snapshot.data.data.length > 1) {
              data = snapshot.data.data[currentDate.day - 1];
            } else {
              data = snapshot.data.data[0];
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    IconButton(
                        icon: const Icon(Icons.settings_rounded),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingsPage()),
                          );
                        },
                        alignment: Alignment.centerRight),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              DateTime d =
                                  DateFormat('dd-MM-y').parseStrict(date);
                              d = d.subtract(const Duration(days: 1));
                              date = DateFormat('dd-MM-y').format(d);
                              currentDate =
                                  currentDate.subtract(const Duration(days: 1));
                            });
                          },
                          child: const Icon(
                            FontAwesomeIcons.arrowAltCircleLeft,
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
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    data.date.hijri.date,
                                    style: const TextStyle(fontSize: 16),
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
                              d = d.add(const Duration(days: 1));
                              date = DateFormat('dd-MM-y').format(d);
                              currentDate =
                                  currentDate.add(const Duration(days: 1));
                            });
                          },
                          child: const Icon(
                            FontAwesomeIcons.arrowAltCircleRight,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    const Text(
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
            );
          } else {
            return const Center(
                child: SizedBox(
              height: 0,
              width: 0,
            ));
          }
        });
  }
}
