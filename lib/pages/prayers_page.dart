import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/components/prayer_item.dart';
import 'package:prayers/pages/settings_page.dart';
import 'package:prayers/providers/prayer_data.dart';

class PrayersPage extends StatefulWidget {
  const PrayersPage({Key? key}) : super(key: key);

  @override
  State<PrayersPage> createState() => _PrayersPageState();
}

class _PrayersPageState extends State<PrayersPage> {
  late String date;
  late Timer timer;
  late String timeRemain = "";
  late String nextPrayer = "";

  String timeBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day, from.hour, from.minute, from.second);
    to = DateTime(to.year, to.month, to.day, to.hour, to.minute, to.second);
    return to.difference(from).inHours.toString().padLeft(2, '0') + ":" + (to.difference(from).inMinutes % 60).toString().padLeft(2, '0') + ":" + (to.difference(from).inSeconds % 60).toString().padLeft(2, '0');
  }

  String fetchPatientCount(CustomData cd) {
    DateTime now = DateTime.now();

    SingleTiming st = cd.timingsList!.reduce((a, b) => a.timing!.difference(now).abs() < b.timing!.difference(now).abs() ? a : b);

    if (st.prayerName! == "Isha") {
      int index = PrayerList.indexWhere((element) => element.date!.readable! == cd.date!.readable!);
      cd = PrayerList[index + 1];
      st = cd.timingsList![0];
    } else if (st.timing!.difference(now) < Duration(seconds: 1)) {
      int index = cd.timingsList!.indexOf(st);
      st = cd.timingsList![index + 2];

      ///Fare modifica per fare si che non si arrivi mai a fine lista
    }
    if (st != null) {
      NextPrayer = st;
      nextPrayer = NextPrayer.prayerName!;
    }

    String s = timeBetween(DateTime.now(), NextPrayer.timing!);
    return s;
  }

  @override
  void initState() {
    super.initState();

    date = DateFormat('dd-MM-y').format(currentDate);

    CustomData cd = PrayerList[DateTime.now().day - 1];

    if (false) {
      timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
        setState(() {
          timeRemain = fetchPatientCount(cd);
        });
      });
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
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
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                actions: [
                  IconButton(
                    color: Colors.black,
                    icon: const Icon(Icons.settings_rounded),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SettingsPage()),
                      );
                    },
                    alignment: Alignment.center,
                  ),
                ],
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(timeRemain, style: Theme.of(context).textTheme.titleLarge,),
                    SizedBox(height: 2,),
                    Text("Prossima preghiera", style: Theme.of(context).textTheme.labelSmall,),
                    Text(nextPrayer, style: Theme.of(context).textTheme.bodyLarge,),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              DateTime d = DateFormat('dd-MM-y').parseStrict(date);
                              d = d.subtract(const Duration(days: 1));
                              date = DateFormat('dd-MM-y').format(d);
                              currentDate = currentDate.subtract(const Duration(days: 1));
                            });
                          },
                          child: const Icon(
                            FontAwesomeIcons.arrowAltCircleLeft,
                            size: 27,
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
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    data.date.hijri.date,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              DateTime d = DateFormat('dd-MM-y').parseStrict(date);
                              d = d.add(const Duration(days: 1));
                              date = DateFormat('dd-MM-y').format(d);
                              currentDate = currentDate.add(const Duration(days: 1));
                            });
                          },
                          child: const Icon(
                            FontAwesomeIcons.arrowAltCircleRight,
                            size: 27,
                          ),
                        ),
                      ],
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
