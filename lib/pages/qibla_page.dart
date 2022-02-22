import 'package:flutter/material.dart';
import 'package:prayers/components/compass.dart';

class QiblaPage extends StatelessWidget {
  const QiblaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Compass(),
      ),
    );
  }
}
