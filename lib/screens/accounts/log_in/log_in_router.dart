import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'log_in_screen.dart';

class LogInRouter {
  static final String route = '/log-in';
  static Router _router;

  LogInRouter(Router router) {
    _router = router;
    router.define(route, handler: Handler(handlerFunc: _handlerFunc));
  }

  Widget _handlerFunc(BuildContext context, Map<String, dynamic> params) {
    return LogInScreen();
  }

  static void navigate(BuildContext context) {
    _router.navigateTo(context, route, transition: TransitionType.native);
  }
}
