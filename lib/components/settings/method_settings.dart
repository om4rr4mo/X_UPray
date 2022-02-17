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
        Container(
          height: MediaQuery.of(context).size.height * 0.55,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    method = 0;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: method == 0
                      ? selectedBoxDecoration(context)
                      : unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                    "Shia Ithna-Ansari",
                    style: method == 0
                        ? Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                selectedBoxDecoration(context).color!))
                        : Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                unselectedBoxDecoration(context).color!)),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    method = 1;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: method == 1
                      ? selectedBoxDecoration(context)
                      : unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                    "University of Islamic Sciences, Karachi",
                    style: method == 1
                        ? Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                selectedBoxDecoration(context).color!))
                        : Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                unselectedBoxDecoration(context).color!)),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    method = 2;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: method == 2
                      ? selectedBoxDecoration(context)
                      : unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                    "Islamic Society of North America",
                    style: method == 2
                        ? Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                selectedBoxDecoration(context).color!))
                        : Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                unselectedBoxDecoration(context).color!)),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    method = 3;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: method == 3
                      ? selectedBoxDecoration(context)
                      : unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                    "Muslim World League",
                    style: method == 3
                        ? Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                selectedBoxDecoration(context).color!))
                        : Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                unselectedBoxDecoration(context).color!)),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    method = 4;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: method == 4
                      ? selectedBoxDecoration(context)
                      : unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                    "Umm Al-Qura University, Makkah",
                    style: method == 4
                        ? Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                selectedBoxDecoration(context).color!))
                        : Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                unselectedBoxDecoration(context).color!)),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    method = 5;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: method == 5
                      ? selectedBoxDecoration(context)
                      : unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                    "Egyptian General Authority of Survey",
                    style: method == 5
                        ? Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                selectedBoxDecoration(context).color!))
                        : Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                unselectedBoxDecoration(context).color!)),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    method = 7;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: method == 7
                      ? selectedBoxDecoration(context)
                      : unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                    "Institute of Geophysics, Tehran",
                    style: method == 7
                        ? Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                selectedBoxDecoration(context).color!))
                        : Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                unselectedBoxDecoration(context).color!)),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    method = 8;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: method == 8
                      ? selectedBoxDecoration(context)
                      : unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                    "Gulf Region",
                    style: method == 8
                        ? Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                selectedBoxDecoration(context).color!))
                        : Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                unselectedBoxDecoration(context).color!)),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    method = 9;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: method == 9
                      ? selectedBoxDecoration(context)
                      : unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                    "Kuwait",
                    style: method == 9
                        ? Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                selectedBoxDecoration(context).color!))
                        : Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                unselectedBoxDecoration(context).color!)),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    method = 10;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: method == 10
                      ? selectedBoxDecoration(context)
                      : unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                    "Qatar",
                    style: method == 10
                        ? Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                selectedBoxDecoration(context).color!))
                        : Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                unselectedBoxDecoration(context).color!)),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    method = 11;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: method == 11
                      ? selectedBoxDecoration(context)
                      : unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                    "Majlis Ugama Islam Singapura",
                    style: method == 11
                        ? Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                selectedBoxDecoration(context).color!))
                        : Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                unselectedBoxDecoration(context).color!)),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    method = 12;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: method == 12
                      ? selectedBoxDecoration(context)
                      : unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                    "Union Organization islamic de France",
                    style: method == 12
                        ? Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                selectedBoxDecoration(context).color!))
                        : Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                unselectedBoxDecoration(context).color!)),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    method = 13;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: method == 13
                      ? selectedBoxDecoration(context)
                      : unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                    "Diyanet İşleri Başkanlığı, Turkey",
                    style: method == 13
                        ? Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                selectedBoxDecoration(context).color!))
                        : Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                unselectedBoxDecoration(context).color!)),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // GestureDetector(
              //   onTap: () {
              //     setState(() {
              //       method = 14;
              //     });
              //   },
              //   child: Container(
              //    padding: EdgeInsets.all(5),
              //    //width: MediaQuery.of(context).size.width * 0.45,
              //    height: MediaQuery.of(context).size.height * 0.07,
              //    decoration: method == 14
              //                     ? selectedBoxDecoration(context)
              //                     : unselectedBoxDecoration(context),
              //    child: Center(
              //        child: Text(
              //          "Spiritual Administration of Muslims of Russia",
              // style: method == 14
              //       ? Theme.of(context).textTheme.button!.copyWith(color: textColorForBackground(selectedBoxDecoration(context).color!)) :
              //        Theme.of(context).textTheme.button!.copyWith(color: textColorForBackground(unselectedBoxDecoration(context).color!)),
              //        )),
              //   ),
              // ),
              // SizedBox(
              //  height: 10,
              // ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    method = 15;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  //width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: method == 15
                      ? selectedBoxDecoration(context)
                      : unselectedBoxDecoration(context),
                  child: Center(
                      child: Text(
                    "Moonsighting Committee Worldwide",
                    style: method == 15
                        ? Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                selectedBoxDecoration(context).color!))
                        : Theme.of(context).textTheme.button!.copyWith(
                            color: textColorForBackground(
                                unselectedBoxDecoration(context).color!)),
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
