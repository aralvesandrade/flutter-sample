import 'package:com_cingulo_sample/common/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum _LKeys {
  apiError,
}

class ErrorsL10n {
  static final Map<String, Map<_LKeys, String>> _localizedValues = {
    L10n.enUS.toString(): {
      _LKeys.apiError: "Oops! Something went wrong when connecting to our servers.",
    },
    L10n.ptBR.toString(): {
      _LKeys.apiError: "Oops! Ocorreram problemas ao conectar com nossos servidores.",
    },
  };

  String get apiError => _localizedValues[locale.toString()][_LKeys.apiError];

  final Locale locale;

  ErrorsL10n(this.locale);

  static const LocalizationsDelegate<dynamic> delegate = _ErrorsL10nDelegate();
}

class _ErrorsL10nDelegate extends L10nDelegate<ErrorsL10n> {
  const _ErrorsL10nDelegate();

  @override
  Future<ErrorsL10n> load(Locale locale) {
    return SynchronousFuture<ErrorsL10n>(ErrorsL10n(locale));
  }
}
