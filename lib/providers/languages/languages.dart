import 'package:flutter/material.dart';

abstract class Languages {

  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get homeNavbarPrayer;

  String get homeNavbarQibla;

  String get homeNavbarTracker;
}