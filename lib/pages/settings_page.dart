import 'package:flutter/material.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/components/navigation_bar.dart';
import 'package:prayers/components/settings/school_settings.dart';
import 'package:prayers/components/settings/theme_settings.dart';
import 'package:prayers/components/user_profile.dart';
import 'package:prayers/providers/firebase_authentication.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          loggedIn && userLogged.photoURL != null
              ? Align(
                  alignment: Alignment.center,
                  child: CircleAvatarWithTransition(
                    transitionBorderwidth: 20,
                    primaryColor: Colors.blue,
                    image: loggedIn && userLogged.photoURL != null
                        ? NetworkImage(
                            userLogged.photoURL!,
                          )
                        : NetworkImage(""),
                  ),
                )
              : Container(),
          SizedBox(
            height: 30,
          ),
          ThemeSetting(),
          SizedBox(
            height: 25,
          ),
          SchoolSetting(),
          SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () async {
              await Authentication.signOut();
              setState(() {
                loggedIn = false;
              });
            },
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
