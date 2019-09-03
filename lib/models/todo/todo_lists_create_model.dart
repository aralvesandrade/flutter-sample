import 'package:com_cingulo_sample/errors/model_error.dart';

class TodoListsCreateModel {
  final String name;

  TodoListsCreateModel(this.name);
}

class TodoListsCreateModelError implements ModelError {
  @override
  final String generic;
  final String name;

  TodoListsCreateModelError({this.generic, this.name});
}
