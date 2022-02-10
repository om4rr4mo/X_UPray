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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
              //     Text(
              //       "IMPOSTAZIONI",
              //       style: Theme.of(context).textTheme.headline1,
              //     ),
              //     //user.photoURL != null
              //     //    ? ClipOval(
              //     //  child: Material(
              //     //    color: kBlueMainColor,
              //     //    child: Image.network(
              //     //      user.photoURL,
              //     //      fit: BoxFit.fitHeight,
              //     //    ),
              //     //  ),
              //     //)
              //     //    :
              //     ClipOval(
              //       child: Material(
              //         color: Theme.of(context).backgroundColor,
              //         child: Padding(
              //           padding: EdgeInsets.all(5.0),
              //           child: Icon(
              //             Icons.person,
              //             size: 25,
              //             color: Colors.white,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Align(
                alignment: Alignment.center,
                child: CircleAvatarWithTransition(
              transitionBorderwidth: 20,
              primaryColor: Colors.blue,
              image: loggedIn
                  ? NetworkImage(
                      userLogged.photoURL!,
                      // "https://lh3.googleusercontent.com/a-/AOh14GiYlXT-DJ8baR8Q_qrx1LxBGYBVQu6JDtC-gr2zGMw=s288-p-rw-no",
                    )
                  : NetworkImage(""),
            ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "IMPOSTAZIONI",
              //       style: Theme.of(context).textTheme.headline1,
              //     ),
              //     //user.photoURL != null
              //     //    ? ClipOval(
              //     //  child: Material(
              //     //    color: kBlueMainColor,
              //     //    child: Image.network(
              //     //      user.photoURL,
              //     //      fit: BoxFit.fitHeight,
              //     //    ),
              //     //  ),
              //     //)
              //     //    :
              //     // ClipOval(
              //     //   child: Material(
              //     //     color: Theme.of(context).backgroundColor,
              //     //     child: const Padding(
              //     //       padding: EdgeInsets.all(5.0),
              //     //       child: Icon(
              //     //         Icons.person,
              //     //         size: 25,
              //     //         color: Colors.white,
              //     //       ),
              //     //     ),
              //     //   ),
              //     // ),
              //     const CircleAvatarWithTransition(primaryColor: Colors.blue, image: NetworkImage("https://lh3.googleusercontent.com/a-/AOh14GiYlXT-DJ8baR8Q_qrx1LxBGYBVQu6JDtC-gr2zGMw=s288-p-rw-no",)),
              //   ],
              // ),
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
