import 'package:com_cingulo_sample/screens/accounts/accounts_router.dart';
import 'package:com_cingulo_sample/screens/settings/settings_router.dart';
import 'package:com_cingulo_sample/screens/splash/splash_router.dart';
import 'package:com_cingulo_sample/screens/todo/todo_router.dart';
import 'package:fluro/fluro.dart';

class AppRouter {
  static final _router = Router();
  static bool _initialized = false;

  static Router get router {
    if (!_initialized) {
      _init();
    }
    return _router;
  }

  static void _init() {
    _initialized = true;
    AccountsRouter(_router);
    SettingsRouter(_router);
    SplashRouter(_router);
    TodoRouter(_router);
  }
}
