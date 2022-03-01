import 'package:flutter/material.dart';

import 'language_ar.dart';
import 'language_ita.dart';
import 'languages.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {

  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'ar', 'hi'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'ita':
        return LanguageIta();
      case 'ar':
        return LanguageAr();
      default:
        return LanguageIta();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;

}