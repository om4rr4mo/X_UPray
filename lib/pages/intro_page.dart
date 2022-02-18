import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/components/location_button.dart';
import 'package:prayers/components/notification_button.dart';
import 'package:prayers/pages/home_page.dart';
import 'package:prayers/pages/tracker_page.dart';
import 'package:prayers/providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget {
  final SharedPreferences prefs;
  final String boolKey;

  const IntroPage({Key? key, required this.prefs, required this.boolKey})
      : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  late Timer timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(milliseconds: 500), (_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _onIntroEnd(context) {
    widget.prefs.setBool(widget.boolKey, false);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  Widget _buildImage(String assetName, [double width = 340]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      pageColor: Theme.of(context).colorScheme.background,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      isBottomSafeArea: true,
      isProgress: true,
      isProgressTap: true,
      globalBackgroundColor: Theme.of(context).colorScheme.background,
      globalFooter: (isNotificationEnabled && isLocationEnabled)
          ? SizedBox(
              width: double.infinity,
              height: 90,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.blue),
                ),
                child: Text(
                  'Tutto pronto per iniziare',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyText2!.color),
                ),
                onPressed: () => _onIntroEnd(context),
              ),
            )
          : null,
      pages: [
        PageViewModel(
          title: "Intro 1",
          body: "Lunga descrizione",
          image: _buildImage('mecca.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Intro 2",
          body: "Lunga descrizione",
          image: _buildImage('mecca.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          image: _buildImage('mecca.png'),
          titleWidget: Text(
            "Attiva funzionalità",
            style: pageDecoration.titleTextStyle,
          ),
          bodyWidget: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LocationButton(),
                SizedBox(
                  height: 20,
                ),
                NotificationButton(),
              ],
            ),
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: false,
      showDoneButton: false,
      showNextButton: false,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: DotsDecorator(
        size: Size(10.0, 10.0),
        color: Theme.of(context).unselectedWidgetColor,
        activeSize: Size(22.0, 10.0),
        activeColor: Theme.of(context).scaffoldBackgroundColor,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
