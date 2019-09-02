import 'package:com_cingulo_sample/common/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum _LKeys {
  title,
  passwordRecovery,
  divider,
  signUp,
  formEmail,
  formPassword,
  formSubmit,
}

class LogInL10n {
  static final Map<String, Map<_LKeys, String>> _localizedValues = {
    L10n.ptBR.toString(): {
      _LKeys.title: "Vamos começar?",
      _LKeys.formEmail: "Email",
      _LKeys.formPassword: "Senha",
      _LKeys.formSubmit: "Entrar",
      _LKeys.passwordRecovery: "Esqueceu sua senha?",
      _LKeys.divider: "ou",
      _LKeys.signUp: "Criar nova conta",
    },
  };

  String get title => _localizedValues[locale.toString()][_LKeys.title];
  String get formEmail => _localizedValues[locale.toString()][_LKeys.formEmail];
  String get formPassword => _localizedValues[locale.toString()][_LKeys.formPassword];
  String get formSubmit => _localizedValues[locale.toString()][_LKeys.formSubmit];
  String get passwordRecovery => _localizedValues[locale.toString()][_LKeys.passwordRecovery];
  String get divider => _localizedValues[locale.toString()][_LKeys.divider];
  String get signUp => _localizedValues[locale.toString()][_LKeys.signUp];

  final Locale locale;

  LogInL10n(this.locale);

  static const LocalizationsDelegate<dynamic> delegate = _LogInL10nDelegate();
}

class _LogInL10nDelegate extends L10nDelegate<LogInL10n> {
  const _LogInL10nDelegate();

  @override
  Future<LogInL10n> load(Locale locale) {
    return SynchronousFuture<LogInL10n>(LogInL10n(locale));
  }
}
