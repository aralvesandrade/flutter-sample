import 'package:com_cingulo_sample/screens/todo/todo_create/todo_create_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class TodoCreateRouter {
  static final String route = '/todo/create';
  static Router _router;

  TodoCreateRouter(Router router) {
    _router = router;
    router.define(route, handler: Handler(handlerFunc: _handlerFunc));
  }

  Widget _handlerFunc(BuildContext context, Map<String, dynamic> params) {
    return TodoCreateScreen();
  }

  static void navigate(BuildContext context) {
    _router.navigateTo(context, route);
  }
}
