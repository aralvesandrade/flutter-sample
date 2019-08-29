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
  }
}
