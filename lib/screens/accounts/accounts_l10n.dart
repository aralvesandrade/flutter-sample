import 'package:com_cingulo_sample/screens/accounts/log_in/log_in_l10n.dart';
import 'package:com_cingulo_sample/screens/accounts/sign_up/sign_up_l10n.dart';
import 'package:flutter/material.dart';

class AccountsL10n {
  static const List<LocalizationsDelegate<dynamic>> delegates = [
    LogInL10n.delegate,
    SignUpL10n.delegate,
  ];
}
