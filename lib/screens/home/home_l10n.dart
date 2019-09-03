import 'package:com_cingulo_sample/common/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum _LKeys {
  title,
  emptyMessage,
  dialogTitle,
  dialogInputLabel,
  dialogCancelButton,
  dialogConfirmButton,
}

class HomeL10n {
  final Locale locale;

  HomeL10n(this.locale);

  static final Map<String, Map<_LKeys, String>> _localizedValues = {
    L10n.ptBR.toString(): {
      _LKeys.title: "Sample",
      _LKeys.emptyMessage: "Vamos começar criando uma lista de tarefas!",
      _LKeys.dialogTitle: "Nova lista de tarefas",
      _LKeys.dialogInputLabel: "Nome",
      _LKeys.dialogCancelButton: "cancelar",
      _LKeys.dialogConfirmButton: "confirmar",
    },
    L10n.enUS.toString(): {
      _LKeys.title: "Sample",
      _LKeys.emptyMessage: "Let's start creating a Todo list!",
      _LKeys.dialogTitle: "New todo list",
      _LKeys.dialogInputLabel: "Name",
      _LKeys.dialogCancelButton: "cancel",
      _LKeys.dialogConfirmButton: "confirm",
    }
  };

  String get title => _localizedValues[locale.toString()][_LKeys.title];
  String get emptyMessage => _localizedValues[locale.toString()][_LKeys.emptyMessage];
  String get dialogTitle => _localizedValues[locale.toString()][_LKeys.dialogTitle];
  String get dialogInputLabel => _localizedValues[locale.toString()][_LKeys.dialogInputLabel];
  String get dialogCancelButton => _localizedValues[locale.toString()][_LKeys.dialogCancelButton];
  String get dialogConfirmButton => _localizedValues[locale.toString()][_LKeys.dialogConfirmButton];

  static const LocalizationsDelegate<dynamic> delegate = _HomeL10nDelegate();
}

class _HomeL10nDelegate extends L10nDelegate<HomeL10n> {
  const _HomeL10nDelegate();

  @override
  Future<HomeL10n> load(Locale locale) {
    return SynchronousFuture<HomeL10n>(HomeL10n(locale));
  }
}
