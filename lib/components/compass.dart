import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:location/location.dart';
import 'package:after_layout/after_layout.dart';

class Compass extends StatefulWidget {
  const Compass({Key? key}) : super(key: key);

  @override
  _CompassState createState() => _CompassState();
}

class _CompassState extends State<Compass> with AfterLayoutMixin<Compass>{
  Offset copernicus = Offset(21.4225, 39.8262);
  Tangent? tangent;
  final imageAngle = math.pi / 4.5;

  double get tangentAngle => (tangent?.angle ?? math.pi / 2) - math.pi / 2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.90,
            child: Image.asset(
              'assets/images/incompass.png',
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        // Positioned(
        //   top: 0,
        //   bottom: 0,
        //   child: StreamBuilder<double>(
        //     stream: FlutterCompass.events,
        //     builder: (context, snapshot) {
        //       double angle = ((snapshot.data ?? 0) * (math.pi / 180) * -1);
        //       return Transform.rotate(
        //         angle: angle + imageAngle - tangentAngle,
        //         // alignment: Alignment(-0.05, -0.035),
        //         alignment: Alignment(0, 0),
        //         child: ClipPath(
        //           //clipper: CompassClipper(),
        //           child: Image.asset(
        //             'assets/images/mycompass.png',
        //             fit: BoxFit.scaleDown,
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    Location().getLocation().then((locationData) {
      setState(() {
        Offset myLocation =
        Offset(locationData.latitude, locationData.longitude);
        tangent = Tangent(
          Offset.zero,
          copernicus - myLocation,
        );
      });
    });
  }
}

class CompassClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double centerX = width / 2 - 0.05 * width / 2;
    double centerY = height / 2 - 0.035 * height / 2;
    final path = Path();
    path.addOval(
      Rect.fromCircle(
        center: Offset(centerX, centerY),
        radius: height / 4,
      ),
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
