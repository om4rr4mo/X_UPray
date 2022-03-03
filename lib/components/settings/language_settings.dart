import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/providers/languages/language_data.dart';
import 'package:prayers/providers/languages/locale_constant.dart';

class LanguageSetting extends StatefulWidget {
  const LanguageSetting({Key? key}) : super(key: key);

  @override
  _LanguageSettingState createState() => _LanguageSettingState();
}

class _LanguageSettingState extends State<LanguageSetting> {
  List<String> languageList = <String>[];
  LanguageData it = LanguageData.languageList()[0];
  LanguageData ar = LanguageData.languageList()[1];
  LanguageData en = LanguageData.languageList()[2];
  LanguageData fr = LanguageData.languageList()[3];

  //String en = 'English';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    languageList = <String>[];

    switch (method) {
      case 1:
        languageList.add(it.name);
        break;
      case 2:
        languageList.add(ar.name);
        break;
      case 3:
        languageList.add(en.name);
        break;
      case 4:
        languageList.add(fr.name);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Lingua",
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
                  style: toggleButtonStyle(
                      context, languageList.contains(it.name)),
                  onPressed: () {
                    languageList = <String>[];
                    languageList.add(it.name);

                    setState(() {
                      LangChoose = LanguageEnum.IT;
                    });

                    changeLanguage(context, it.languageCode);
                  },
                  child: Center(child: Text(it.name)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  style: toggleButtonStyle(
                      context, languageList.contains(ar.name)),
                  onPressed: () {
                    languageList = <String>[];
                    languageList.add(ar.name);

                    setState(() {
                      LangChoose = LanguageEnum.AR;
                    });

                    changeLanguage(context, ar.languageCode);
                  },
                  child: Center(child: Text(ar.name)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  style: toggleButtonStyle(
                      context, languageList.contains(en.name)),
                  onPressed: () {
                    languageList = <String>[];
                    languageList.add(en.name);

                    setState(() {
                      LangChoose = LanguageEnum.EN;
                    });

                    changeLanguage(context, en.languageCode);
                  },
                  child: Center(child: Text(en.name)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  style: toggleButtonStyle(
                      context, languageList.contains(fr.name)),
                  onPressed: () {
                    languageList = <String>[];
                    languageList.add(fr.name);

                    setState(() {
                      LangChoose = LanguageEnum.FR;
                    });

                    changeLanguage(context, fr.languageCode);
                  },
                  child: Center(child: Text(fr.name)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
