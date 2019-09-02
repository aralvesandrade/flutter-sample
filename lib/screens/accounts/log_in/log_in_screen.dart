import 'dart:async';

import 'package:com_cingulo_sample/app/app_l10n.dart';
import 'package:com_cingulo_sample/screens/accounts/log_in/log_in_form.dart';
import 'package:com_cingulo_sample/screens/accounts/log_in/log_in_l10n.dart';
import 'package:com_cingulo_sample/screens/accounts/sign_up/sign_up_router.dart';
import 'package:com_cingulo_sample/widgets/components/components.dart';
import 'package:com_cingulo_sample/widgets/styles/styles.dart';
import 'package:flutter/widgets.dart';

class LogInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LogInScreenState();
  }
}

class LogInScreenState extends State<LogInScreen> {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 1500),
      () => setState(() => _opacity = 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final LogInL10n l10n = AppL10n.of<LogInL10n>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: FadedBlueScaffold(
        showBackButton: false,
        title: l10n.title,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(Dimens.defaultBodyMargin, 0, Dimens.defaultBodyMargin, Dimens.defaultBodyMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LogInForm(),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: ButtonWhite(
                  text: l10n.passwordRecovery, onPressed: () {}, // TODO PasswordRecoveryRouter.navigate(context),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 28, bottom: 36),
                child: DividerText(text: l10n.divider),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonGreen(
                    text: l10n.signUp,
                    onPressed: () => SignUpRouter.navigate(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
