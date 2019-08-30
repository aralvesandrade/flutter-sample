import 'package:com_cingulo_sample/app/app.dart';
import 'package:com_cingulo_sample/screens/splash/splash_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class SplashRouter {
  static final String route = '/splash';
  static Router _router;

  SplashRouter(Router router) {
    _router = router;
    router.define(route, handler: Handler(handlerFunc: _handlerFunc));
  }

  Widget _handlerFunc(BuildContext context, Map<String, dynamic> params) {
    return SplashScreen();
  }

  static void navigate([BuildContext context]) {
    if (context == null) {
      App.navigatorKey.currentState.pushNamedAndRemoveUntil(SplashRouter.route, (_) => false);
    } else {
      _router.navigateTo(context, route, transition: TransitionType.fadeIn, clearStack: true);
    }
  }
}
