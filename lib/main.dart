import 'package:flutter/material.dart';
import 'package:prayers/pages/loading_pages.dart';
import 'package:prayers/providers/theme_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'UPray',
            theme: MyTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            home: LoadingPage(),
          );
        });
  }
}
