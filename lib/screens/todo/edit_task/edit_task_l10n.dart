import 'package:com_cingulo_sample/common/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum _LKeys {
  title,
  btnDelete,
  deleteConfirmTitle,
  deleteConfirmText,
  deleteConfirmBtnYes,
  deleteConfirmBtnNo,
  btnSave,
  inputNameLabel,
  inputNotesLabel,
  checkboxDoneLabel,
}

class EditTaskL10n {
  final Locale locale;

  EditTaskL10n(this.locale);

  static final Map<String, Map<_LKeys, String>> _localizedValues = {
    L10n.enUS.toString(): {
      _LKeys.title: "Task",
      _LKeys.btnDelete: "Delete",
      _LKeys.deleteConfirmTitle: "Are you sure?",
      _LKeys.deleteConfirmText: "This action can't be undone.",
      _LKeys.deleteConfirmBtnYes: "Yes, delete",
      _LKeys.deleteConfirmBtnNo: "No",
      _LKeys.inputNameLabel: "Name",
      _LKeys.inputNotesLabel: "Notes",
      _LKeys.checkboxDoneLabel: "Done",
      _LKeys.btnSave: "Save",
    },
    L10n.ptBR.toString(): {
      _LKeys.title: "Tarefa",
      _LKeys.btnDelete: "Deletar",
      _LKeys.deleteConfirmTitle: "Tem certeza?",
      _LKeys.deleteConfirmText: "Essa ação não pode ser desfeita.",
      _LKeys.deleteConfirmBtnYes: "Sim, deletar",
      _LKeys.deleteConfirmBtnNo: "Não",
      _LKeys.inputNameLabel: "Nome",
      _LKeys.inputNotesLabel: "Anotações",
      _LKeys.checkboxDoneLabel: "Concluída",
      _LKeys.btnSave: "Salvar",
    },
  };

  String get title => _localizedValues[locale.toString()][_LKeys.title];
  String get btnDelete => _localizedValues[locale.toString()][_LKeys.btnDelete];
  String get deleteConfirmTitle => _localizedValues[locale.toString()][_LKeys.deleteConfirmTitle];
  String get deleteConfirmText => _localizedValues[locale.toString()][_LKeys.deleteConfirmText];
  String get deleteConfirmBtnYes => _localizedValues[locale.toString()][_LKeys.deleteConfirmBtnYes];
  String get deleteConfirmBtnNo => _localizedValues[locale.toString()][_LKeys.deleteConfirmBtnNo];
  String get inputNameLabel => _localizedValues[locale.toString()][_LKeys.inputNameLabel];
  String get inputNotesLabel => _localizedValues[locale.toString()][_LKeys.inputNotesLabel];
  String get checkboxDoneLabel => _localizedValues[locale.toString()][_LKeys.checkboxDoneLabel];
  String get btnSave => _localizedValues[locale.toString()][_LKeys.btnSave];

  static const LocalizationsDelegate<dynamic> delegate = _EditTaskL10nDelegate();
}

class _EditTaskL10nDelegate extends L10nDelegate<EditTaskL10n> {
  const _EditTaskL10nDelegate();

  @override
  Future<EditTaskL10n> load(Locale locale) {
    return SynchronousFuture<EditTaskL10n>(EditTaskL10n(locale));
  }
}
