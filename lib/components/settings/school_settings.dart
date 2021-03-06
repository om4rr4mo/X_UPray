import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prayers/Utility/TGBL.dart';

class SchoolSetting extends StatefulWidget {
  const SchoolSetting({Key? key}) : super(key: key);

  @override
  State<SchoolSetting> createState() => _SchoolSettingState();
}

class _SchoolSettingState extends State<SchoolSetting> {
  List<String> schoolList = <String>[];
  String hanafi = 'Hanafi';
  String shafi = 'Shafi';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    schoolList = <String>[];
    if (school == 0) {
      schoolList.add(shafi);
    } else {
      schoolList.add(hanafi);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Scuola",
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                style: toggleButtonStyle(context, schoolList.contains(shafi)),
                onPressed: () {
                  schoolList = <String>[];
                  schoolList.add(shafi);

                  setState(() {
                    school = 0;

                    prayerProvider
                        .getTimings(DateFormat('dd-MM-y').format(currentDate));
                  });
                },
                child: Center(
                  child: Text(shafi),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                style: toggleButtonStyle(context, schoolList.contains(hanafi)),
                onPressed: () {
                  schoolList = <String>[];
                  schoolList.add(hanafi);

                  setState(() {
                    school = 1;

                    prayerProvider
                        .getTimings(DateFormat('dd-MM-y').format(currentDate));
                  });
                },
                child: Center(
                  child: Text(hanafi),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
