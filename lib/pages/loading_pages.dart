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
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.60,
        child: Lottie.asset(
          'assets/lotties/muslim_home.json',
          width: double.infinity,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}