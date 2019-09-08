import 'package:com_cingulo_sample/common/l10n.dart';
import 'package:com_cingulo_sample/screens/todo/add_task/add_task_l10n.dart';
import 'package:com_cingulo_sample/screens/todo/edit_task/edit_task_l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum _LKeys {
  title,
  empty,
}

class TodoL10n {
  final Locale locale;

  TodoL10n(this.locale);

  static final Map<String, Map<_LKeys, String>> _localizedValues = {
    L10n.enUS.toString(): {
      _LKeys.title: "Cíngulo Flutter Sample",
      _LKeys.empty: "Start by creating a task",
    },
    L10n.ptBR.toString(): {
      _LKeys.title: "Exemplo em Flutter do Cíngulo",
      _LKeys.empty: "Comece criando uma tarefa",
    },
  };

  String get title => _localizedValues[locale.toString()][_LKeys.title];
  String get empty => _localizedValues[locale.toString()][_LKeys.empty];

  static const List<LocalizationsDelegate<dynamic>> delegates = [
    _TodoL10nDelegate(),
    AddTaskL10n.delegate,
    EditTaskL10n.delegate,
  ];
}

class _TodoL10nDelegate extends L10nDelegate<TodoL10n> {
  const _TodoL10nDelegate();

  @override
  Future<TodoL10n> load(Locale locale) {
    return SynchronousFuture<TodoL10n>(TodoL10n(locale));
  }
}
