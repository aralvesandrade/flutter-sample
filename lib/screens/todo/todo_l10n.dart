import 'package:com_cingulo_sample/common/l10n.dart';
import 'package:com_cingulo_sample/screens/todo/todo_create/todo_create_l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum _LKeys {
  title,
  emptyMessage,
  logOut,
}

class TodoL10n {
  final Locale locale;

  TodoL10n(this.locale);

  static final Map<String, Map<_LKeys, String>> _localizedValues = {
    L10n.ptBR.toString(): {
      _LKeys.title: "Sample",
      _LKeys.emptyMessage: "Vamos começar criando uma lista de tarefas!",
      _LKeys.logOut: "LogOut",
    },
    L10n.enUS.toString(): {
      _LKeys.title: "Sample",
      _LKeys.emptyMessage: "Let's start creating a Todo list!",
      _LKeys.logOut: "LogOut",
    }
  };

  String get title => _localizedValues[locale.toString()][_LKeys.title];
  String get emptyMessage => _localizedValues[locale.toString()][_LKeys.emptyMessage];
  String get logOut => _localizedValues[locale.toString()][_LKeys.logOut];

  static const List<LocalizationsDelegate<dynamic>> delegates = [
    _TodoL10nDelegate(),
    TodoCreateL10n.delegate,
  ];
}

class _TodoL10nDelegate extends L10nDelegate<TodoL10n> {
  const _TodoL10nDelegate();

  @override
  Future<TodoL10n> load(Locale locale) {
    return SynchronousFuture<TodoL10n>(TodoL10n(locale));
  }
}
