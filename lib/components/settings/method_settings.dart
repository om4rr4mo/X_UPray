import 'package:flutter/material.dart';
import 'package:prayers/Utility/TGBL.dart';

class MethodSetting extends StatefulWidget {
  const MethodSetting({Key? key}) : super(key: key);

  @override
  _MethodSettingState createState() => _MethodSettingState();
}

class _MethodSettingState extends State<MethodSetting> {
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
        GestureDetector(
          onTap: () {
            setState(() {

            });
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.50,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                        "Shia Ithna-Ansari",
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: selectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                          "University of Islamic Sciences, Karachi",
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                        "Islamic Society of North America",
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                        "Muslim World League",
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                        "Umm Al-Qura University, Makkah",
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                        "Egyptian General Authority of Survey",
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                        "Institute of Geophysics, Tehran",
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                        "Gulf Region",
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                        "Kuwait",
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                        "Qatar",
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                        "Majlis Ugama Islam Singapura",
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                        "Union Organization islamic de France",
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                        "Diyanet İşleri Başkanlığı, Turkey",
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                //Container(
                //  padding: EdgeInsets.all(5),
                //  //width: MediaQuery.of(context).size.width * 0.45,
                //  height: MediaQuery.of(context).size.height * 0.07,
                //  decoration: unselectedBoxDecoration(context),
                //  child: Center(
                //      child: Text(
                //        "Spiritual Administration of Muslims of Russia",
                //      )),
                //),
                //SizedBox(
                //  height: 10,
                //),
                Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                        "Moonsighting Committee Worldwide",
                      )),
                ),
                SizedBox(
                  height: 10,
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
