import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:prayers/Utility/TGBL.dart';
import 'package:prayers/components/location_button.dart';
import 'package:prayers/components/notification_button.dart';
import 'package:prayers/pages/home_page.dart';
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

    timer = Timer.periodic(const Duration(milliseconds: 500), (_) {
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
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  Widget _buildImage(String assetName) {
    return Image.asset('assets/images/$assetName');
  }

  @override
  Widget build(BuildContext context) {
    var pageDecoration = const PageDecoration(
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      isBottomSafeArea: true,
      globalFooter: (isNotificationEnabled && isLocationEnabled)
          ? SizedBox(
              width: double.infinity,
              height: 80,
              child: ElevatedButton(
                child: const Text(
                  'Tutto pronto per iniziare',
                  style: TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => _onIntroEnd(context),
                style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7),
                            topRight: Radius.circular(7)))),
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
          titleWidget: const Text(
            "Attiva funzionalità",
          ),
          bodyWidget: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
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
      skip: const Text(
        'Skip',
        textAlign: TextAlign.start,
      ),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done'),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        activeSize: Size(23.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(21)),
        ),
      ),
    );
  }
}
