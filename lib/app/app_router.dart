import 'package:com_cingulo_sample/screens/accounts/log_in/log_in_router.dart';
import 'package:com_cingulo_sample/screens/accounts/sign_up/sign_up_router.dart';
import 'package:com_cingulo_sample/screens/todo/todo_router.dart';
import 'package:com_cingulo_sample/screens/splash/splash_router.dart';
import 'package:fluro/fluro.dart';

class AppRouter {
  static final _router = Router();
  static bool _initialized = false;

  static Router get router {
    if (!_initialized) {
      _initialize();
    }
    return _router;
  }

  static void _initialize() {
    _initialized = true;
    LogInRouter(_router);
    SplashRouter(_router);
    SignUpRouter(_router);
    TodoRouter(_router);
  }
}
