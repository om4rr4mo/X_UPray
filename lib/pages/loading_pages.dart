import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:prayers/Utility/TGBL.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoadingPage> createState() {
    return _LoadingPageState();
  }
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void dispose() {
  super.dispose();

  controller.dispose();
  }

  @override
  void initState() {
  super.initState();

  controller = AnimationController(
    duration: const Duration(
      milliseconds: 1000,
    ),
    vsync: this,
  );
  animation = CurvedAnimation(
    parent: controller,
    curve: Curves.easeIn,
  );

  controller.forward();

  Future.delayed(const Duration(milliseconds: 4750), () {
  Navigator.of(context).pushReplacement(createRoute(context));
  });
  }

/*  final double _initial = 0.0;

  void update() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _initial = _initial + 0.1;
      });
    }
    );
  } */

  @override
  Widget build(BuildContext context) {
  //  update(); //
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height * 0.65,
              child: Lottie.asset(
                'assets/lotties/muslim_home.json',
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.center,
              height: 400,
              width: MediaQuery.of(context).size.width * 0.80,
            /*  child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  valueColor: const AlwaysStoppedAnimation<Color> (Colors.teal),
                  backgroundColor: Colors.grey,
                  minHeight: 8,
                  value: _initial,
                  semanticsLabel: 'Linear progress indicator',
                ),
              ), */
            ),
          ),
        ],
      ),
    );
  }
}