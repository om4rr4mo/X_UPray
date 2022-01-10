import 'package:flutter/material.dart';
import 'package:prayers/components/navigation_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            child: Text("SETTINGS"),
          ),
        ));
  }
}
