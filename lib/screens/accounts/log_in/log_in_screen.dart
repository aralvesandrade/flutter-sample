import 'package:com_cingulo_sample/app/app_l10n.dart';
import 'package:com_cingulo_sample/screens/accounts/log_in/log_in_form.dart';
import 'package:com_cingulo_sample/screens/accounts/log_in/log_in_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LogInL10n l10n = AppL10n.of<LogInL10n>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: LogInForm(),
      ),
    );
  }
}
