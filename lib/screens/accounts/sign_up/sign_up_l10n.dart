import 'package:com_cingulo_sample/common/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum _LKeys {
  title,
  formUsername,
  formFullName,
  formEmail,
  formPassword,
  formSubmit,
  logIn,
}

class SignUpL10n {
  static final Map<String, Map<_LKeys, String>> _localizedValues = {
    L10n.ptBR.toString(): {
      _LKeys.title: "Vamos criar sua conta?",
      _LKeys.formUsername: "Username",
      _LKeys.formFullName: "Nome e Sobrenome",
      _LKeys.formEmail: "Email",
      _LKeys.formPassword: "Senha",
      _LKeys.formSubmit: "Criar nova conta",
      _LKeys.logIn: "Já tem cadastro? Fazer login",
    },
  };

  String get title => _localizedValues[locale.toString()][_LKeys.title];
  String get formUsername => _localizedValues[locale.toString()][_LKeys.formUsername];
  String get formFullName => _localizedValues[locale.toString()][_LKeys.formFullName];
  String get formEmail => _localizedValues[locale.toString()][_LKeys.formEmail];
  String get formPassword => _localizedValues[locale.toString()][_LKeys.formPassword];
  String get formSubmit => _localizedValues[locale.toString()][_LKeys.formSubmit];
  String get logIn => _localizedValues[locale.toString()][_LKeys.logIn];

  final Locale locale;

  SignUpL10n(this.locale);

  static const LocalizationsDelegate<dynamic> delegate = _SignUpL10nDelegate();
}

class _SignUpL10nDelegate extends L10nDelegate<SignUpL10n> {
  const _SignUpL10nDelegate();

  @override
  Future<SignUpL10n> load(Locale locale) {
    return SynchronousFuture<SignUpL10n>(SignUpL10n(locale));
  }
}
