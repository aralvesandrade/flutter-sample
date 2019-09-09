import 'dart:io';

import 'package:flutter/material.dart';

class L10n {
  static const Locale enUS = Locale.fromSubtags(languageCode: 'en', countryCode: 'US');
  static const Locale ptBR = Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR');

  static const List<Locale> locales = [enUS, ptBR];

  static const Locale defaultLocale = enUS;

  static bool isSupported(Locale locale) => locales.contains(locale);

  static Locale getCurrentLocale() {
    final platformLocale = getPlatformLocale();
    if (L10n.isSupported(platformLocale)) {
      return platformLocale;
    }
    for (var i = 0; i < L10n.locales.length; i++) {
      if (platformLocale.languageCode == L10n.locales[i].languageCode) {
        return L10n.locales[i];
      }
    }
    return L10n.defaultLocale;
  }

  static Locale getPlatformLocale() {
    final List<String> codes = Platform.localeName.split('_');
    if (codes.length == 2) {
      return Locale(codes[0], codes[1]);
    } else if (codes.length == 1) {
      return Locale(codes[0]);
    } else {
      return L10n.defaultLocale;
    }
  }
}

abstract class L10nDelegate<T> extends LocalizationsDelegate<T> {
  const L10nDelegate();

  @override
  bool isSupported(Locale locale) => L10n.isSupported(locale);

  @override
  bool shouldReload(LocalizationsDelegate<T> old) => false;
}
