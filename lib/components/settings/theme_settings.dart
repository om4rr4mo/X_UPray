import 'package:flutter/material.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeSetting extends StatefulWidget {
  @override
  State<ThemeSetting> createState() => _ThemeSettingState();
}

class _ThemeSettingState extends State<ThemeSetting> {
  List<String> themeList = <String>[];
  String chiaro = 'Chiaro';
  String scuro = 'Scuro';

  @override
  void initState() {
    themeList = <String>[];
    if (ThemeProvider().getTheme == ThemeMode.dark)
      themeList.add(scuro);
    else
      themeList.add(chiaro);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = ThemeProvider();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Tema",
          style: Theme.of(context).textTheme.subtitle2,
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                style: toggleButtonStyle(context, themeList.contains(chiaro)),
                onPressed: () {
                  themeList = <String>[];
                  themeList.add(chiaro);

                  final provider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  provider.toggleTheme(ThemeMode.light);

                  setState(() {});
                },
                child: Center(
                  child: Icon(Icons.brightness_7_rounded,
                      color: themeList.contains(chiaro)
                          ? Colors.amberAccent
                          : Theme.of(context).colorScheme.secondary),
                ),
              ),
            ),
            SizedBox(
              width: 2.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                style: toggleButtonStyle(context, themeList.contains(scuro)),
                onPressed: () {
                  themeList = <String>[];
                  themeList.add(scuro);

                  final provider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  provider.toggleTheme(ThemeMode.dark);

                  setState(() {});
                },
                child: Center(
                  child: Icon(Icons.brightness_2_rounded,
                      color: themeList.contains(scuro)
                          ? Colors.amberAccent
                          : Theme.of(context).colorScheme.secondary),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
