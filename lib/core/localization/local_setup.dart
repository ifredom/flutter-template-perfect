import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localization.dart';

/// List of languages codes that the app will support
/// https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
const supportedLocalCodes = ['zh', 'en'];

final supportedLocales = supportedLocalCodes
    .map<Locale>((code) => Locale.fromSubtags(languageCode: code))
    .toList();

/// A callback provided by [MaterialApp] that lets you
/// specify which locales you plan to support by returning them.
Locale loadSupportedLocals(Locale locale, Iterable<Locale> supportedLocales) {
  if (locale == null) {
    Intl.defaultLocale = supportedLocales.first.languageCode;
    return supportedLocales.first;
  }

  for (final supportedLocale in supportedLocales) {
    if (supportedLocale.languageCode == locale.languageCode ||
        supportedLocale.countryCode == locale.countryCode) {
      Intl.defaultLocale = supportedLocale.languageCode;
      return supportedLocale;
    }
  }

  Intl.defaultLocale = supportedLocales.first.languageCode;
  return supportedLocales.first;
}

/// Internationalized apps that require translations for one of the
/// locales listed in [GlobalMaterialLocalizations] should specify
/// this parameter and list the [supportedLocales] that the
/// application can handle.
List<LocalizationsDelegate> get localizationsDelegates {
  return [
    const AppLocalizationsDelegate(),
    const FallbackCupertinoLocalizationsDelegate(),
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}
