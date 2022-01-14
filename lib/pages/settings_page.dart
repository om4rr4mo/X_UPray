import 'package:flutter/material.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/components/navigation_bar.dart';
import 'package:prayers/components/settings/school_settings.dart';
import 'package:prayers/components/settings/theme_settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "IMPOSTAZIONI",
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 30,
          ),
          ThemeSetting(),
          Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 11, bottom: 8),
            child: Divider(
              thickness: 2,
              color: Theme.of(context).dividerColor,
            ),
          ),
          SchoolSetting(),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () => loggedIn = false,
            child: Text(
              "SETTINGS\nclicca qui per fare il logout (solo test)\nNella pagina tracker si dovrà rifare il login",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ));
  }
}
