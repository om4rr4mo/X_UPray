import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prayers/Utility/TGBL.dart';

class SchoolSetting extends StatefulWidget {
  const SchoolSetting({Key? key}) : super(key: key);

  @override
  State<SchoolSetting> createState() => _SchoolSettingState();
}

class _SchoolSettingState extends State<SchoolSetting> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Scuola",
          style: Theme.of(context).textTheme.subtitle2,
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  school = 0;

                  prayerProvider
                      .getTimings(DateFormat('dd-MM-y').format(currentDate));
                });
              },
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.10,
                decoration: school == 0
                    ? selectedBoxDecoration(context)
                    : unselectedBoxDecoration(context),
                child: Center(
                    child: Text(
                  "Shafi".toUpperCase(),
                  style: school == 0
                      ? Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(fontWeight: FontWeight.bold)
                      : null,
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  school = 1;

                  prayerProvider
                      .getTimings(DateFormat('dd-MM-y').format(currentDate));
                });
              },
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.10,
                decoration: school == 1
                    ? selectedBoxDecoration(context)
                    : unselectedBoxDecoration(context),
                child: Center(
                    child: Text(
                  "Hanafi".toUpperCase(),
                  style: school == 1
                      ? Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(fontWeight: FontWeight.bold)
                      : null,
                )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
