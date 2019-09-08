import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'sign_up_screen.dart';

class SignUpRouter {
  static final String route = '/sign-up';
  static Router _router;

  SignUpRouter(Router router) {
    _router = router;
    router.define(route, handler: Handler(handlerFunc: _handlerFunc));
  }

  Widget _handlerFunc(BuildContext context, Map<String, dynamic> params) {
    return SignUpScreen();
  }

  static void navigate(BuildContext context) {
    _router.navigateTo(context, route, transition: TransitionType.fadeIn, clearStack: true);
  }
}
