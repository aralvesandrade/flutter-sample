import 'package:com_cingulo_sample/screens/todo/edit_task/edit_task_router.dart';
import 'package:com_cingulo_sample/screens/todo/todo_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class TodoRouter {
  static final String route = '/todo';
  static Router _router;

  TodoRouter(Router router) {
    _router = router;
    router.define(route, handler: Handler(handlerFunc: _handlerFunc));
    EditTaskRouter(router);
  }

  Widget _handlerFunc(BuildContext context, Map<String, dynamic> params) {
    return TodoScreen();
  }

  static void navigate(BuildContext context) {
    _router.navigateTo(context, route, transition: TransitionType.fadeIn, clearStack: true);
  }
}
