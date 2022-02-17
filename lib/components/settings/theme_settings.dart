import 'package:flutter/material.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeSetting extends StatefulWidget {
  @override
  State<ThemeSetting> createState() => _ThemeSettingState();
}

class _ThemeSettingState extends State<ThemeSetting> {
  late ThemeMode themeMode;

  @override
  void initState() {
    super.initState();

    themeMode = ThemeMode.dark;
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = ThemeProvider();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tema",
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
                final provider =
                    Provider.of<ThemeProvider>(context, listen: false);
                provider.toggleTheme(ThemeMode.light);

                themeMode = ThemeMode.light;

                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: themeMode == ThemeMode.light
                    ? selectedBoxDecoration(context)
                    : unselectedBoxDecoration(context),
                child: Center(
                    child: Text(
                  "Chiaro",
                  style: themeMode == ThemeMode.light
                      ? Theme.of(context).textTheme.button!.copyWith(
                          color: textColorForBackground(
                              selectedBoxDecoration(context).color!))
                      : Theme.of(context).textTheme.button!.copyWith(
                          color: textColorForBackground(
                              unselectedBoxDecoration(context).color!)),
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                final provider =
                    Provider.of<ThemeProvider>(context, listen: false);
                provider.toggleTheme(ThemeMode.dark);

                themeMode = ThemeMode.dark;

                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: themeMode == ThemeMode.dark
                    ? selectedBoxDecoration(context)
                    : unselectedBoxDecoration(context),
                child: Center(
                    child: Text(
                      "Scuro",
                  style: themeMode == ThemeMode.dark
                      ? Theme.of(context).textTheme.button!.copyWith(
                          color: textColorForBackground(
                              selectedBoxDecoration(context).color!))
                      : Theme.of(context).textTheme.button!.copyWith(
                          color: textColorForBackground(
                              unselectedBoxDecoration(context).color!)),
                )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
