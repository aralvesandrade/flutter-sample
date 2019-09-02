import 'package:com_cingulo_sample/models/auth/auth_token_model.dart';

class Analytics {
  static void identifyUser(AuthTokenModel auth) {
    // TODO: Identify user at Analytics service
  }

  static void nonFatalError(dynamic exception, StackTrace stack, {dynamic context = ''}) {
    // TODO: Log non fatal error at Analytics service
  }

  static void log(String message) {
    // TODO: log message at Analytics service
  }
}
