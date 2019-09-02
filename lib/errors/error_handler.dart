import 'package:com_cingulo_sample/app/app.dart';
import 'package:com_cingulo_sample/app/app_di.dart';
import 'package:com_cingulo_sample/common/analytics.dart';
import 'package:com_cingulo_sample/errors/model_error.dart';
import 'package:com_cingulo_sample/errors/unauthenticated_error.dart';
import 'package:com_cingulo_sample/screens/splash/splash_router.dart';
import 'package:pedantic/pedantic.dart';

class ErrorHandler {
  static void handle(Object error, {StackTrace stackTrace}) async {
    if (error is UnauthenticatedError) {
      handleUnauthenticatedError();
    } else if (error is ModelError) {
      // Skip
    } else {
      // TODO: Add offline service
      Analytics.nonFatalError(error, stackTrace, context: 'ErrorHandler.handle');
    }
  }

  static void handleUnauthenticatedError() async {
    AppDi.reset();
    unawaited(App.navigatorKey.currentState.pushNamed(SplashRouter.route));
  }
}
