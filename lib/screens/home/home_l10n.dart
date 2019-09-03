import 'package:com_cingulo_sample/common/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum _LKeys {
  title,
  emptyMessage,
}

class HomeL10n {
  final Locale locale;

  HomeL10n(this.locale);

  static final Map<String, Map<_LKeys, String>> _localizedValues = {
    L10n.ptBR.toString(): {
      _LKeys.title: "Sample",
      _LKeys.emptyMessage: "Vamos começar criando uma lista de Todo!",
    },
    L10n.enUS.toString(): {
      _LKeys.title: "Sample",
      _LKeys.emptyMessage: "Let's start creating a Todo list!",
    }
  };

  String get title => _localizedValues[locale.toString()][_LKeys.title];
  String get emptyMessage => _localizedValues[locale.toString()][_LKeys.emptyMessage];

  static const LocalizationsDelegate<dynamic> delegate = _HomeL10nDelegate();
}

class _HomeL10nDelegate extends L10nDelegate<HomeL10n> {
  const _HomeL10nDelegate();

  @override
  Future<HomeL10n> load(Locale locale) {
    return SynchronousFuture<HomeL10n>(HomeL10n(locale));
  }
}
