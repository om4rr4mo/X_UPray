import 'package:flutter/material.dart';

class MethodSetting extends StatefulWidget {
  const MethodSetting({Key? key}) : super(key: key);

  @override
  _MethodSettingState createState() => _MethodSettingState();
}

class _MethodSettingState extends State<MethodSetting> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Metodo",
        style: Theme.of(context).textTheme.subtitle2,
        textAlign: TextAlign.start,
      ),
    ]);
  }
}
