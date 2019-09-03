import 'package:com_cingulo_sample/common/l10n.dart';
import 'package:com_cingulo_sample/screens/accounts/log_in/log_in_l10n.dart';
import 'package:com_cingulo_sample/screens/accounts/sign_up/sign_up_l10n.dart';
import 'package:com_cingulo_sample/screens/home/home_l10n.dart';
import 'package:com_cingulo_sample/widgets/components/components_l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

enum _LKeys {
  title,
}

class AppL10n {
  static final Map<String, Map<_LKeys, String>> _localizedValues = {
    L10n.ptBR.toString(): {
      _LKeys.title: "Cíngulo sample app",
    },
  };

  String get title => _localizedValues[locale.toString()][_LKeys.title];

  final Locale locale;

  AppL10n(this.locale);

  static T of<T>(BuildContext context) {
    return Localizations.of<T>(context, T);
  }

  static final List<LocalizationsDelegate<dynamic>> delegates = [
    GlobalCupertinoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    _AppL10nDelegate(),
    ...ComponentsL10n.delegates,
    SignUpL10n.delegate,
    LogInL10n.delegate,
    HomeL10n.delegate,
  ];
}

class _AppL10nDelegate extends L10nDelegate<AppL10n> {
  const _AppL10nDelegate();

  @override
  Future<AppL10n> load(Locale locale) {
    return SynchronousFuture<AppL10n>(AppL10n(locale));
  }
}
