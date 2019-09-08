import 'package:com_cingulo_sample/errors/model_error.dart';

class TaskModel {
  String id;
  String name;
  String notes;
  bool done;

  TaskModel({this.id, this.name, this.notes, this.done});
}

class TaskModelError implements ModelError {
  @override
  final String generic;
  final String name;

  TaskModelError({
    this.generic,
    this.name,
  });
}
