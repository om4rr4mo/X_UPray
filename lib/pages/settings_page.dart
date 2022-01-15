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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "IMPOSTAZIONI",
                style: Theme.of(context).textTheme.headline1,
              ),
              //user.photoURL != null
              //    ? ClipOval(
              //  child: Material(
              //    color: kBlueMainColor,
              //    child: Image.network(
              //      user.photoURL,
              //      fit: BoxFit.fitHeight,
              //    ),
              //  ),
              //)
              //    :
              ClipOval(
                child: Material(
                  color: Theme.of(context).backgroundColor,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.person,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          ThemeSetting(),
          SizedBox(height: 25,),
          SchoolSetting(),
          SizedBox(height: 25,),

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
