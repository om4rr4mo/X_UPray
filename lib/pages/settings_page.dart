import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/components/settings/language_settings.dart';
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
      appBar: AppBar(
        title: const Text(
          "IMPOSTAZIONI",
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height * 0.10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(21),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: const Icon(
              FontAwesomeIcons.arrowAltCircleLeft,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            alignment: Alignment.centerLeft,
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.90,
          child: Stack(
            children: [
              /*IconButton(
                icon: const Icon(
                  FontAwesomeIcons.arrowAltCircleLeft,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                alignment: Alignment.centerLeft,
              ),*/
              ListView(
                children: [
                  loggedIn && userLogged.photoURL != null
                      ? Align(
                          alignment: Alignment.center,
                          child: CircleAvatarWithTransition(
                            transitionBorderwidth: 20,
                            primaryColor: Colors.black,
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
                  const LanguageSetting(),
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
