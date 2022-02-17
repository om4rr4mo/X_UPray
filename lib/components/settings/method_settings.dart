import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prayers/Utility/TGBL.dart';

class MethodSetting extends StatefulWidget {
  const MethodSetting({Key? key}) : super(key: key);

  @override
  _MethodSettingState createState() => _MethodSettingState();
}

class _MethodSettingState extends State<MethodSetting> {
  List<String> methodList = <String>[];
  String ansari = 'Shia Ithna-Ansari';
  String karachi = 'University of Islamic Sciences, Karachi';
  String america = 'Islamic Society of North America';
  String worldLeague = 'Muslim World League';
  String makkah = 'Umm Al-Qura University, Makkah';
  String egyptian = 'Egyptian General Authority of Survey';
  String tehran = 'Institute of Geophysics, University of Tehran';
  String gulf = 'Gulf Region';
  String kuwait = 'Kuwait';
  String qatar = 'Qatar';
  String singapura = 'Majlis Ugama Islam Singapura';
  String france = 'Union Organization islamic de France';
  String turkey = ' Diyanet İşleri Başkanlığı, Turkey';
  String worldwide = 'Moonsighting Committee Worldwide';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    methodList = <String>[];

    switch (method) {
      case 0:
        methodList.add(ansari);
        break;
      case 1:
        methodList.add(karachi);
        break;
      case 2:
        methodList.add(america);
        break;
      case 3:
        methodList.add(worldLeague);
        break;
      case 4:
        methodList.add(makkah);
        break;
      case 5:
        methodList.add(egyptian);
        break;
      case 7:
        methodList.add(tehran);
        break;
      case 8:
        methodList.add(gulf);
        break;
      case 9:
        methodList.add(kuwait);
        break;
      case 10:
        methodList.add(kuwait);
        break;
      case 11:
        methodList.add(qatar);
        break;
      case 12:
        methodList.add(singapura);
        break;
      case 13:
        methodList.add(france);
        break;
      case 14:
        methodList.add(turkey);
        break;
      case 15:
        methodList.add(worldwide);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Metodo di calcolo",
          style: Theme.of(context).textTheme.subtitle2,
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.60,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  style:
                      toggleButtonStyle(context, methodList.contains(ansari)),
                  onPressed: () {
                    methodList = <String>[];
                    methodList.add(ansari);

                    setState(() {
                      method = 0;

                      prayerProvider.getTimings(
                          DateFormat('dd-MM-y').format(currentDate));
                    });
                  },
                  child: Center(
                      child: Text(
                    ansari,
                    style: toggleTextStyle(context,
                        Theme.of(context).textTheme.button!, method == 0),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  style:
                      toggleButtonStyle(context, methodList.contains(karachi)),
                  onPressed: () {
                    methodList = <String>[];
                    methodList.add(karachi);

                    setState(() {
                      method = 1;

                      prayerProvider.getTimings(
                          DateFormat('dd-MM-y').format(currentDate));
                    });
                  },
                  child: Center(
                      child: Text(
                    karachi,
                    style: toggleTextStyle(context,
                        Theme.of(context).textTheme.button!, method == 1),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  style:
                      toggleButtonStyle(context, methodList.contains(america)),
                  onPressed: () {
                    methodList = <String>[];
                    methodList.add(america);

                    setState(() {
                      method = 2;

                      prayerProvider.getTimings(
                          DateFormat('dd-MM-y').format(currentDate));
                    });
                  },
                  child: Center(
                      child: Text(
                    america,
                    style: toggleTextStyle(context,
                        Theme.of(context).textTheme.button!, method == 2),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  style: toggleButtonStyle(
                      context, methodList.contains(worldLeague)),
                  onPressed: () {
                    methodList = <String>[];
                    methodList.add(worldLeague);

                    setState(() {
                      method = 3;

                      prayerProvider.getTimings(
                          DateFormat('dd-MM-y').format(currentDate));
                    });
                  },
                  child: Center(
                      child: Text(
                    worldLeague,
                    style: toggleTextStyle(context,
                        Theme.of(context).textTheme.button!, method == 3),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  style:
                      toggleButtonStyle(context, methodList.contains(makkah)),
                  onPressed: () {
                    methodList = <String>[];
                    methodList.add(makkah);

                    setState(() {
                      method = 4;

                      prayerProvider.getTimings(
                          DateFormat('dd-MM-y').format(currentDate));
                    });
                  },
                  child: Center(
                      child: Text(
                    makkah,
                    style: toggleTextStyle(context,
                        Theme.of(context).textTheme.button!, method == 4),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  style:
                      toggleButtonStyle(context, methodList.contains(egyptian)),
                  onPressed: () {
                    methodList = <String>[];
                    methodList.add(egyptian);

                    setState(() {
                      method = 5;

                      prayerProvider.getTimings(
                          DateFormat('dd-MM-y').format(currentDate));
                    });
                  },
                  child: Center(
                      child: Text(
                    egyptian,
                    style: toggleTextStyle(context,
                        Theme.of(context).textTheme.button!, method == 5),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  style:
                      toggleButtonStyle(context, methodList.contains(tehran)),
                  onPressed: () {
                    methodList = <String>[];
                    methodList.add(tehran);

                    setState(() {
                      method = 7;

                      prayerProvider.getTimings(
                          DateFormat('dd-MM-y').format(currentDate));
                    });
                  },
                  child: Center(
                      child: Text(
                    tehran,
                    style: toggleTextStyle(context,
                        Theme.of(context).textTheme.button!, method == 7),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  style: toggleButtonStyle(context, methodList.contains(gulf)),
                  onPressed: () {
                    methodList = <String>[];
                    methodList.add(gulf);

                    setState(() {
                      method = 8;

                      prayerProvider.getTimings(
                          DateFormat('dd-MM-y').format(currentDate));
                    });
                  },
                  child: Center(
                      child: Text(
                    gulf,
                    style: toggleTextStyle(context,
                        Theme.of(context).textTheme.button!, method == 8),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  style:
                      toggleButtonStyle(context, methodList.contains(kuwait)),
                  onPressed: () {
                    methodList = <String>[];
                    methodList.add(kuwait);

                    setState(() {
                      method = 9;

                      prayerProvider.getTimings(
                          DateFormat('dd-MM-y').format(currentDate));
                    });
                  },
                  child: Center(
                      child: Text(
                    kuwait,
                    style: toggleTextStyle(context,
                        Theme.of(context).textTheme.button!, method == 9),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  style: toggleButtonStyle(context, methodList.contains(qatar)),
                  onPressed: () {
                    methodList = <String>[];
                    methodList.add(qatar);

                    setState(() {
                      method = 10;

                      prayerProvider.getTimings(
                          DateFormat('dd-MM-y').format(currentDate));
                    });
                  },
                  child: Center(
                      child: Text(
                    qatar,
                    style: toggleTextStyle(context,
                        Theme.of(context).textTheme.button!, method == 10),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  style: toggleButtonStyle(
                      context, methodList.contains(singapura)),
                  onPressed: () {
                    methodList = <String>[];
                    methodList.add(singapura);

                    setState(() {
                      method = 11;

                      prayerProvider.getTimings(
                          DateFormat('dd-MM-y').format(currentDate));
                    });
                  },
                  child: Center(
                      child: Text(
                    singapura,
                    style: toggleTextStyle(context,
                        Theme.of(context).textTheme.button!, method == 11),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  style:
                      toggleButtonStyle(context, methodList.contains(france)),
                  onPressed: () {
                    methodList = <String>[];
                    methodList.add(france);

                    setState(() {
                      method = 12;

                      prayerProvider.getTimings(
                          DateFormat('dd-MM-y').format(currentDate));
                    });
                  },
                  child: Center(
                      child: Text(
                    france,
                    style: toggleTextStyle(context,
                        Theme.of(context).textTheme.button!, method == 12),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  style:
                      toggleButtonStyle(context, methodList.contains(turkey)),
                  onPressed: () {
                    methodList = <String>[];
                    methodList.add(turkey);

                    setState(() {
                      method = 13;

                      prayerProvider.getTimings(
                          DateFormat('dd-MM-y').format(currentDate));
                    });
                  },
                  child: Center(
                      child: Text(
                    turkey,
                    style: toggleTextStyle(context,
                        Theme.of(context).textTheme.button!, method == 13),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  style: toggleButtonStyle(
                      context, methodList.contains(worldwide)),
                  onPressed: () {
                    methodList = <String>[];
                    methodList.add(worldwide);

                    setState(() {
                      method = 15;

                      prayerProvider.getTimings(
                          DateFormat('dd-MM-y').format(currentDate));
                    });
                  },
                  child: Center(
                      child: Text(
                    worldwide,
                    style: toggleTextStyle(context,
                        Theme.of(context).textTheme.button!, method == 15),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
