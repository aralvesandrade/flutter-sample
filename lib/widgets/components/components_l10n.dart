import 'dart:io';

import 'package:com_cingulo_sample/common/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum _LKeys {
  fieldsGender,
  fieldsGenderHelper,
  fieldsGenderFemale,
  fieldsGenderMale,
  fieldsGenderUnknown,
  shareButton,
  appReviewTitle,
  appReviewText,
  appReviewYes,
  appReviewNo,
  dialogUnknownErrorTitle,
  dialogUnknownErrorText,
  dialogUnknownErrorButton,
}

class ComponentsL10n {
  static final Map<String, Map<_LKeys, String>> _localizedValues = {
    L10n.ptBR.toString(): {
      _LKeys.fieldsGender: "Sexo",
      _LKeys.fieldsGenderHelper: "Nosso conteúdo é personalizado por gênero.",
      _LKeys.fieldsGenderFemale: "Feminino",
      _LKeys.fieldsGenderMale: "Masculino",
      _LKeys.fieldsGenderUnknown: "Não desejo informar",
      _LKeys.shareButton: "Compartilhar",
      _LKeys.appReviewTitle: "Avalie na {store}",
      _LKeys.appReviewText: "Você também está gostando? Sua boa avaliação possibilita ao Cíngulo ajudar mais pessoas. É rápido.",
      _LKeys.appReviewYes: "Sim, quero avaliar",
      _LKeys.appReviewNo: "Não",
      _LKeys.dialogUnknownErrorTitle: "Ops",
      _LKeys.dialogUnknownErrorText: "Ocorreu um problema desconhecido. Por favor, tente novamente em alguns instantes.",
      _LKeys.dialogUnknownErrorButton: "Entendi",
    },
  };

  String get fieldsGender => _localizedValues[locale.toString()][_LKeys.fieldsGender];
  String get fieldsGenderHelper => _localizedValues[locale.toString()][_LKeys.fieldsGenderHelper];
  String get fieldsGenderFemale => _localizedValues[locale.toString()][_LKeys.fieldsGenderFemale];
  String get fieldsGenderMale => _localizedValues[locale.toString()][_LKeys.fieldsGenderMale];
  String get fieldsGenderUnknown => _localizedValues[locale.toString()][_LKeys.fieldsGenderUnknown];
  String get shareButton => _localizedValues[locale.toString()][_LKeys.shareButton];
  String get appReviewTitle =>
      _localizedValues[locale.toString()][_LKeys.appReviewTitle].replaceFirst('{store}', Platform.isAndroid ? 'Google Play' : 'App Store');
  String get appReviewText => _localizedValues[locale.toString()][_LKeys.appReviewText];
  String get appReviewYes => _localizedValues[locale.toString()][_LKeys.appReviewYes];
  String get appReviewNo => _localizedValues[locale.toString()][_LKeys.appReviewNo];
  String get dialogUnknownErrorTitle => _localizedValues[locale.toString()][_LKeys.dialogUnknownErrorTitle];
  String get dialogUnknownErrorText => _localizedValues[locale.toString()][_LKeys.dialogUnknownErrorText];
  String get dialogUnknownErrorButton => _localizedValues[locale.toString()][_LKeys.dialogUnknownErrorButton];

  final Locale locale;

  ComponentsL10n(this.locale);

  static const List<LocalizationsDelegate<dynamic>> delegates = [
    _ComponentsL10nDelegate(),
  ];
}

class _ComponentsL10nDelegate extends L10nDelegate<ComponentsL10n> {
  const _ComponentsL10nDelegate();

  @override
  Future<ComponentsL10n> load(Locale locale) {
    return SynchronousFuture<ComponentsL10n>(ComponentsL10n(locale));
  }
}
