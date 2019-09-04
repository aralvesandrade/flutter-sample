import 'package:com_cingulo_sample/common/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum _LKeys {
  title,
  cancelButton,
  saveButton,
  formTitle,
  formDescription,
  formInputLabel,
}

class TodoCreateL10n {
  final Locale locale;

  TodoCreateL10n(this.locale);

  static final Map<String, Map<_LKeys, String>> _localizedValues = {
    L10n.ptBR.toString(): {
      _LKeys.title: "lista de tarefa",
      _LKeys.cancelButton: "cancelar",
      _LKeys.saveButton: "salvar",
      _LKeys.formTitle: "Foo bar",
      _LKeys.formDescription: "Foo bar",
      _LKeys.formInputLabel: "Nome",
    },
    L10n.enUS.toString(): {
      _LKeys.title: "todo list",
      _LKeys.cancelButton: "cancel",
      _LKeys.saveButton: "save",
      _LKeys.formTitle: "Foo bar",
      _LKeys.formDescription: "Foo bar",
      _LKeys.formInputLabel: "Name",
    },
  };

  String get title => _localizedValues[locale.toString()][_LKeys.title];
  String get cancelButton => _localizedValues[locale.toString()][_LKeys.cancelButton];
  String get saveButton => _localizedValues[locale.toString()][_LKeys.saveButton];

  String get formTitle => _localizedValues[locale.toString()][_LKeys.formTitle];
  String get formDescription => _localizedValues[locale.toString()][_LKeys.formDescription];
  String get formInputLabel => _localizedValues[locale.toString()][_LKeys.formInputLabel];

  static const LocalizationsDelegate<dynamic> delegate = _TodoCreateL10nDelegate();
}

class _TodoCreateL10nDelegate extends L10nDelegate<TodoCreateL10n> {
  const _TodoCreateL10nDelegate();

  @override
  Future<TodoCreateL10n> load(Locale locale) {
    return SynchronousFuture<TodoCreateL10n>(TodoCreateL10n(locale));
  }
}
