import 'package:com_cingulo_sample/app/app.dart';
import 'package:com_cingulo_sample/app/app_di.dart';
import 'package:com_cingulo_sample/app/app_l10n.dart';
import 'package:com_cingulo_sample/common/analytics.dart';
import 'package:com_cingulo_sample/errors/api_error.dart';
import 'package:com_cingulo_sample/errors/erros_l10n.dart';
import 'package:com_cingulo_sample/errors/model_error.dart';
import 'package:com_cingulo_sample/errors/unauthenticated_error.dart';
import 'package:com_cingulo_sample/screens/splash/splash_router.dart';
import 'package:com_cingulo_sample/widgets/dialogs.dart';
import 'package:flutter/material.dart';

class ErrorHandler {
  static void handle(Object error, {StackTrace stackTrace, BuildContext context}) {
    if (error is UnauthenticatedError) {
      handleUnauthenticatedError();
    } else if (error is ModelError && error.generic != null && context != null) {
      DialogAlert.show(context, error.generic);
    } else if (error is ApiError && context != null) {
      final l10n = AppL10n.of<ErrorsL10n>(context);
      DialogAlert.show(context, l10n.apiError);
    } else {
      Analytics.nonFatalError(error, stackTrace, context: 'ErrorHandler.handle.else');
    }
  }

  static void handleUnauthenticatedError() async {
    final di = await AppDi.instance();
    await di.authRepository.deleteToken();
    AppDi.reset();
    // Use App.navigatorKey.currentState because
    // Router.navigateTo does not work with App.navigatorKey.currentContext.
    await App.navigatorKey.currentState.pushNamed(SplashRouter.route);
  }
}
