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
  String karachi = 'Karachi';
  String america = 'ISNA, North America';
  String worldLeague = 'Muslim World League';
  String makkah = 'Umm Al-Qura University, Makkah';
  String egyptian = 'Egypt';
  String kuwait = 'Kuwait';
  String qatar = 'Qatar';
  String singapura = 'Majlis Ugama Islam Singapura';
  String france = 'UOIF, France';
  String turkey = ' Diyanet İşleri Başkanlığı, Turkey';
  String worldwide = 'Moonsighting Committee';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    methodList = <String>[];

    switch (method) {
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
      case 9:
        methodList.add(kuwait);
        break;
      case 10:
        methodList.add(qatar);
        break;
      case 11:
        methodList.add(singapura);
        break;
      case 12:
        methodList.add(france);
        break;
      case 13:
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
        const Text(
          "Metodo di calcolo",
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.40,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
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
                  child: Center(child: Text(karachi)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
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
                  child: Center(child: Text(america)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
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
                  child: Center(child: Text(worldLeague)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
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
                  child: Center(child: Text(makkah)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
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
                  child: Center(child: Text(egyptian)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
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
                  child: Center(child: Text(kuwait)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
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
                  child: Center(child: Text(qatar)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
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
                  child: Center(child: Text(singapura)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
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
                  child: Center(child: Text(france)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
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
                  child: Center(child: Text(turkey)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
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
                  child: Center(child: Text(worldwide)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
