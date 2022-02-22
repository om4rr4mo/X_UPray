import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/components/settings/method_settings.dart';
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
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.90,
          child: Stack(
            children: [
              ListView(
                children: [
                  IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.arrowAltCircleLeft,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    alignment: Alignment.centerLeft,
                  ),
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
                                : const NetworkImage(""),
                          ),
                        )
                      : Container(),
                  const ThemeSetting(),
                  const SizedBox(
                    height: 25,
                  ),
                  const SchoolSetting(),
                  const SizedBox(
                    height: 25,
                  ),
                  const MethodSetting(),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Authentication.signOut();
                      setState(() {
                        loggedIn = false;
                      });
                    },
                    child: const Text(
                      "SETTINGS\nclicca qui per fare il logout (solo test)\nNella pagina tracker si dovrà rifare il login",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
