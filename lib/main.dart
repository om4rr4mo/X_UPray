import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:prayers/pages/home_page.dart';
import 'package:prayers/pages/loading_pages.dart';
import 'package:prayers/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import 'Utility/TGBL.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          return MaterialApp(
            title: 'UPray',
            theme: MyTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );
        }
    );
  }
}
