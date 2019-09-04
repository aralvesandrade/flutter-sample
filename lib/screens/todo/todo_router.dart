import 'package:com_cingulo_sample/screens/todo/todo_create/todo_create_router.dart';
import 'package:com_cingulo_sample/screens/todo/todo_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class TodoRouter {
  static final String route = '/todo';
  static Router _router;

  TodoRouter(Router router) {
    _router = router;
    router.define(route, handler: Handler(handlerFunc: _handlerFunc));
    TodoCreateRouter(router);
  }

  Widget _handlerFunc(BuildContext context, Map<String, dynamic> params) {
    return TodoScreen();
  }

  static void navigate(BuildContext context) {
    _router.navigateTo(context, route);
  }
}
