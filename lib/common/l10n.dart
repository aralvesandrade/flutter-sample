import 'package:flutter/material.dart';

class L10n {
  static const Locale enUS = Locale.fromSubtags(languageCode: 'en', countryCode: 'US');
  static const Locale ptBR = Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR');

  static const List<Locale> locales = [enUS, ptBR];

  static bool isSupported(Locale locale) => locales.contains(locale);

  static const Locale defaultLocale = enUS;
}

abstract class L10nDelegate<T> extends LocalizationsDelegate<T> {
  const L10nDelegate();

  @override
  bool isSupported(Locale locale) => L10n.isSupported(locale);

  @override
  bool shouldReload(LocalizationsDelegate<T> old) => false;
}
