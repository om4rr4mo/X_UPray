import 'package:flutter/material.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/components/navigation_bar.dart';
import 'package:prayers/components/theme_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Column(
        children: [
          ChangeThemeButtonWidget(),
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
