import 'package:com_cingulo_sample/app/app_l10n.dart';
import 'package:com_cingulo_sample/screens/accounts/log_in/log_in_router.dart';
import 'package:com_cingulo_sample/widgets/buttons.dart';
import 'package:flutter/material.dart';

import 'sign_up_form.dart';
import 'sign_up_l10n.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SignUpL10n l10n = AppL10n.of<SignUpL10n>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.title),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SignUpForm(),
              Container(height: 24),
              ButtonClear(
                text: l10n.logIn,
                onPressed: () => LogInRouter.navigate(context),
                themeData: Theme.of(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
