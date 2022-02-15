import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingBar extends StatefulWidget {
  const LoadingBar({Key? key}) : super(key: key);

  @override
  _LoadingBarState createState() => _LoadingBarState();
}

class _LoadingBarState extends State<LoadingBar> with TickerProviderStateMixin {
  late AnimationController controller;

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
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lotties/muslim_home.json',
      width: double.infinity,
      fit: BoxFit.contain,
    );
  }
}
