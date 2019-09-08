import 'dart:async';

import 'package:com_cingulo_sample/common/repository.dart';
import 'package:com_cingulo_sample/data/todo/mappers/task_mapper.dart';
import 'package:com_cingulo_sample/data/todo/todo_api.dart';
import 'package:com_cingulo_sample/models/todo/task_model.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

class TodoRepository extends Repository {
  final PublishSubject<void> _tasksUpdated$$ = PublishSubject<void>();
  Stream<void> get tasksUpdated$ => _tasksUpdated$$.stream;

  final TodoApi _todoApi;

  List<TaskModel> _tasksCache;
  Completer<void> _tasksLoader;

  @provide
  @singleton
  TodoRepository(this._todoApi);

  @override
  void postInit() {
    super.postInit();
    disposableFunctions.add(_tasksUpdated$$.close);
  }

  @override
  void onRefreshDaily() {
    _tasksCache = null;
  }

  Future<List<TaskModel>> getTasks() async {
    // Sample cache
    // Sample lock for concurrent requests
    if (_tasksCache == null) {
      if (_tasksLoader == null) {
        _tasksLoader = Completer<void>();
        final response = await _todoApi.getTasks();
        _tasksCache = TaskMapper.responseListToModelList(response);
        _tasksLoader.complete();
        _tasksLoader = null;
      } else {
        await _tasksLoader.future;
        return getTasks();
      }
    }
    return _tasksCache;
  }

  Future<TaskModel> getTask(String id) async {
    final response = await _todoApi.getTask(id);
    return TaskMapper.responseToModel(response);
  }

  Future<void> createTask(TaskModel model) async {
    final request = TaskMapper.modelToRequest(model);
    await _todoApi.createTask(request, TaskMapper.badRequestToModelError);
    _tasksCache = null;
    _tasksUpdated$$.add(null);
  }

  Future<void> updateTask(TaskModel model) async {
    final request = TaskMapper.modelToRequest(model);
    await _todoApi.updateTask(model.id, request, TaskMapper.badRequestToModelError);
    _tasksCache = null;
    _tasksUpdated$$.add(null);
  }

  Future<void> deleteTask(TaskModel model) async {
    await _todoApi.deleteTask(model.id);
    _tasksCache = null;
    _tasksUpdated$$.add(null);
  }
}
