import 'package:flutter/material.dart';

abstract class Languages {

  static Languages? of(BuildContext context) {
    var loc = Localizations.of<Languages>(context, Languages);
    return loc;
  }

  String get homeNavbarPrayer;

  String get homeNavbarQibla;

  String get homeNavbarTracker;
}