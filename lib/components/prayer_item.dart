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
    DateTime parseDate = new DateFormat("HH:mm").parse(prayerTime);
    String formattedPrayerTime = DateFormat('kk:mm').format(parseDate);

    Widget sliderContent = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Notification Menu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width *
                    0.45,
                height: MediaQuery.of(context).size.height *
                    0.10,
                decoration:
                unselectedBoxDecoration(context),
                child: Center(
                    child: Text(
                      'on'.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width *
                    0.45,
                height: MediaQuery.of(context).size.height *
                    0.10,
                decoration:
                unselectedBoxDecoration(context),
                child: Center(
                    child: Text(
                      'off'.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(20),
            //width: MediaQuery.of(context).size.width * 0.95,
            height:
            MediaQuery.of(context).size.height * 0.10,
            decoration: unselectedBoxDecoration(context),
            child: Center(
                child: Text(
                  'scegli un adhan'.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).iconTheme.color,
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
            //color: Colors.teal,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Flexible(
                flex: 1,
                child: Container(
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
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
<<<<<<< HEAD
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.add_alert),
                    color: Colors.teal,
                    iconSize: 24.0,
                    onPressed: () {
                      showModalBottomSheet<void>(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.only(top: 16),
                            height: 800,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Notification Menu',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        padding: EdgeInsets.all(20),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.10,
                                        decoration:
                                            unselectedBoxDecoration(context),
                                        child: Center(
                                            child: Text(
                                          'on'.toUpperCase(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        padding: EdgeInsets.all(20),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.10,
                                        decoration:
                                            unselectedBoxDecoration(context),
                                        child: Center(
                                            child: Text(
                                          'off'.toUpperCase(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    width: MediaQuery.of(context).size.width *
                                        0.90,
                                    height: MediaQuery.of(context).size.height *
                                        0.10,
                                    decoration:
                                        unselectedBoxDecoration(context),
                                    child: Center(
                                        child: Text(
                                      'scegli un adhan'.toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Theme.of(context).iconTheme.color,
                                  ),
                                  child: const Text('Close'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
=======
              IconButton(
                icon: const Icon(Icons.add_alert),
                  //color: Colors.teal,
                  iconSize: 24.0,
                onPressed: () => showSlider(context, sliderContent)
>>>>>>> 329e8c4e4796eab20fd23478dd99b163defcb214
              ),
            ],
          ),
        ),
      ),
    );
  }
}
