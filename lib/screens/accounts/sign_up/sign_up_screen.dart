import 'package:com_cingulo_sample/app/app_l10n.dart';
import 'package:com_cingulo_sample/app/app_router.dart';
import 'package:com_cingulo_sample/screens/accounts/sign_up/sign_up_form.dart';
import 'package:com_cingulo_sample/screens/accounts/sign_up/sign_up_l10n.dart';
import 'package:com_cingulo_sample/widgets/components/components.dart';
import 'package:com_cingulo_sample/widgets/styles/styles.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SignUpL10n l10n = AppL10n.of<SignUpL10n>(context);
    return FadedBlueScaffold(
      showBackButton: true,
      title: l10n.title,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(Dimens.defaultBodyMargin, 0, Dimens.defaultBodyMargin, Dimens.defaultBodyMargin),
        child: Column(
          children: <Widget>[
            SignUpForm(),
            Container(height: 16),
            ButtonWhite(
              text: l10n.logIn,
              onPressed: () => AppRouter.router.pop(context),
            ),
            Container(height: 8),
          ],
        ),
      ),
    );
  }
}
