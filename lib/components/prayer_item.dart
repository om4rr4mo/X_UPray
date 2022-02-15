import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PrayerItem extends StatelessWidget {
  final String prayerName;
  final String prayerTime;

  const PrayerItem(
      {Key? key, required this.prayerName, required this.prayerTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime parseDate = new DateFormat("HH:mm").parse(prayerTime);
    String formattedPrayerTime = DateFormat('kk:mm').format(parseDate);
    
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.teal,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  formattedPrayerTime,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              Text(
                prayerName,
                style: const TextStyle(
                  fontSize: 17,
                ),
                ),
              IconButton(
                icon: const Icon(Icons.add_alert),
                color: Colors.teal,
                iconSize: 24.0,
                onPressed: () {
                  showModalBottomSheet<void>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    backgroundColor: Colors.teal[50],
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.only(top: 16),
                        height: 800,
                        child: Column(
                          children: <Widget>[
                            const Text(
                              'Notification Menu',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.teal,
                              ),
                              child: const Text('Close'),
                              onPressed: () => Navigator.pop(context),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}