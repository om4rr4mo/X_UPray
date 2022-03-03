import 'package:flutter/material.dart';

abstract class Languages {

  static Languages? of(BuildContext context) {
    var loc = Localizations.of<Languages>(context, Languages);
    return loc;
  }

  String get introButtonStart;

  String get intro1Title;

  String get intro1Body;

  String get intro2Title;

  String get intro2Body;

  String get intro3Title;

  String get intro3Body;

  String get intro4Title;

  String get intro4Body;

  String get intro5Title;

  String get intro5Body;

  String get intro6Title;

  String get introDone;

  String get homeNavbarPrayer;

  String get homeNavbarQibla;

  String get homeNavbarTracker;
}