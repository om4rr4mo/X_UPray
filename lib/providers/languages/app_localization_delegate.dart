import 'package:flutter/material.dart';

import 'language_ar.dart';
import 'language_it.dart';
import 'languages.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {

  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['it', 'ar'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'it':
        return LanguageIt();
      case 'ar':
        return LanguageAr();
      default:
        return LanguageIt();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;

}