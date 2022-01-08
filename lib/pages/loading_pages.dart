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
    //dispose del controller va messo sempre prima della dispose della superclasse
    //https://stackoverflow.com/questions/58802223/flutter-ticker-must-be-disposed-before-calling-super-dispose
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
      setState(() {});
    });

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );

    controller.forward();

    Future.delayed(const Duration(milliseconds: 3500), () {
      Navigator.of(context).pushReplacement(createRoute(context));
    });
  }



  @override
  Widget build(BuildContext context) {
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
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  valueColor: const AlwaysStoppedAnimation<Color> (Colors.teal),
                  backgroundColor: Colors.white,
                  minHeight: 8,
                  value: controller.value,
                  semanticsLabel: 'Linear progress indicator',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}