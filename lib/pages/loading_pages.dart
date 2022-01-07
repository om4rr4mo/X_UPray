import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:prayers/Utility/TGBL.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
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

    Future.delayed(const Duration(milliseconds: 3200), () {
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
              child: Lottie.asset(
                'assets/lotties/progress_bar.json',
                width: double.infinity,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.center,
              height: 400,
              child: const Text(""),
            ),
          ),
        ],
      ),
    );
  }
}
