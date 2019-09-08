import 'package:com_cingulo_sample/screens/settings/settings_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class SettingsRouter {
  static final String route = '/settings';
  static Router _router;

  SettingsRouter(Router router) {
    _router = router;
    router.define(route, handler: Handler(handlerFunc: _handlerFunc));
  }

  Widget _handlerFunc(BuildContext context, Map<String, dynamic> params) {
    return SettingsScreen();
  }

  static void navigate(BuildContext context) {
    _router.navigateTo(context, route, transition: TransitionType.native);
  }
}
