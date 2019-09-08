import 'package:com_cingulo_sample/common/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum _LKeys {
  title,
  hiring,
  simulateExpiredAuthToken,
  simulateInternalServerError,
  languageEnUs,
  languagePtBr,
  themeLight,
  themeDark,
  logout,
  version,
}

class SettingsL10n {
  static final Map<String, Map<_LKeys, String>> _localizedValues = {
    L10n.enUS.toString(): {
      _LKeys.title: "Settings",
      _LKeys.hiring: "We are hiring!",
      _LKeys.simulateExpiredAuthToken: "Simulate expired auth token",
      _LKeys.simulateInternalServerError: "Simulate internal server error",
      _LKeys.languageEnUs: "Change language to en-US",
      _LKeys.languagePtBr: "Change language to pt-BR",
      _LKeys.themeLight: "Use light theme",
      _LKeys.themeDark: "Use dark theme",
      _LKeys.logout: "Log out",
      _LKeys.version: "Version {version}",
    },
    L10n.ptBR.toString(): {
      _LKeys.title: "Configurações",
      _LKeys.hiring: "Estamos contratando!",
      _LKeys.simulateExpiredAuthToken: "Simular autenticação expirada",
      _LKeys.simulateInternalServerError: "Simular erro interno no servidor",
      _LKeys.languageEnUs: "Mudar idioma para en-US",
      _LKeys.languagePtBr: "Mudar idioma para pt-BR",
      _LKeys.themeLight: "Usar o tema claro",
      _LKeys.themeDark: "Usar o tema escuro",
      _LKeys.logout: "Sair",
      _LKeys.version: "Versão {version}",
    },
  };

  String get title => _localizedValues[locale.toString()][_LKeys.title];
  String get hiring => _localizedValues[locale.toString()][_LKeys.hiring];
  String get simulateExpiredAuthToken => _localizedValues[locale.toString()][_LKeys.simulateExpiredAuthToken];
  String get simulateInternalServerError => _localizedValues[locale.toString()][_LKeys.simulateInternalServerError];
  String get languageEnUs => _localizedValues[locale.toString()][_LKeys.languageEnUs];
  String get languagePtBr => _localizedValues[locale.toString()][_LKeys.languagePtBr];
  String get themeLight => _localizedValues[locale.toString()][_LKeys.themeLight];
  String get themeDark => _localizedValues[locale.toString()][_LKeys.themeDark];
  String get logout => _localizedValues[locale.toString()][_LKeys.logout];
  String version(String version) => _localizedValues[locale.toString()][_LKeys.version].replaceAll(
        '{version}',
        version,
      );

  final Locale locale;

  SettingsL10n(this.locale);

  static const LocalizationsDelegate<dynamic> delegate = _SettingsL10nDelegate();
}

class _SettingsL10nDelegate extends L10nDelegate<SettingsL10n> {
  const _SettingsL10nDelegate();

  @override
  Future<SettingsL10n> load(Locale locale) {
    return SynchronousFuture<SettingsL10n>(SettingsL10n(locale));
  }
}
