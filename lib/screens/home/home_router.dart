import 'package:com_cingulo_sample/screens/home/home_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class HomeRouter {
  static final String route = '/home';
  static Router _router;

  HomeRouter(Router router) {
    _router = router;
    router.define(route, handler: Handler(handlerFunc: _handlerFunc));
  }

  Widget _handlerFunc(BuildContext context, Map<String, dynamic> params) {
    return HomeScreen();
  }

  static void navigate(BuildContext context) {
    _router.navigateTo(context, route);
  }
}
