import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prayers/Utility/TGBL.dart';

class PrayerItem extends StatelessWidget {
  final String prayerName;
  final String prayerTime;

  const PrayerItem(
      {Key? key, required this.prayerName, required this.prayerTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime parseDate = DateFormat("HH:mm").parse(prayerTime);
    String formattedPrayerTime = DateFormat('kk:mm').format(parseDate);

    Widget sliderContent = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Notification Menu',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.10,
                decoration: toggleBoxDecoration(context, true),
                child: Center(
                    child: Text(
                  'on'.toUpperCase(),
                )),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.10,
                decoration: toggleBoxDecoration(context, false),
                child: Center(
                    child: Text(
                  'off'.toUpperCase(),
                )),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height * 0.10,
            decoration: toggleBoxDecoration(context, false),
            child: Center(
                child: Text(
              'scegli un adhan'.toUpperCase(),
            )),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(21),
            ),
          ),
          child: const Text('Close'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.6,
          ),
          borderRadius: BorderRadius.circular(21),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    prayerName,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    formattedPrayerTime,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      icon: const Icon(Icons.add_alert),
                      onPressed: () => showSlider(context, sliderContent)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
