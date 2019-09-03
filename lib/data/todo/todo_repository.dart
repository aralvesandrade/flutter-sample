import 'package:com_cingulo_sample/common/repository.dart';
import 'package:com_cingulo_sample/data/todo/mappers/todo_lists_create_mapper.dart';
import 'package:com_cingulo_sample/data/todo/mappers/todo_lists_mapper.dart';
import 'package:com_cingulo_sample/data/todo/todo_api.dart';
import 'package:com_cingulo_sample/models/todo/todo_lists_create_model.dart';
import 'package:com_cingulo_sample/models/todo/todo_lists_model.dart';
import 'package:inject/inject.dart';

class TodoRepository extends Repository {
  final TodoApi _todoApi;

  @provide
  @singleton
  TodoRepository(this._todoApi);

  Future<WrapperTodoListsModel> getTodoList() async {
    final response = await _todoApi.getTodoLists();
    return TodoListsMapper.responseToModel(response);
  }

  Future<void> createTodoList(TodoListsCreateModel model) async {
    final request = TodoListsCreateMapper.modelToRequest(model);
    await _todoApi.createList(request, TodoListsCreateMapper.badRequestToModelError);
  }
}
