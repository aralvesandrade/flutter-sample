import 'package:com_cingulo_sample/common/repository.dart';
import 'package:com_cingulo_sample/data/todo/mappers/todo_lists_create_mapper.dart';
import 'package:com_cingulo_sample/data/todo/mappers/todo_lists_mapper.dart';
import 'package:com_cingulo_sample/data/todo/todo_api.dart';
import 'package:com_cingulo_sample/models/todo/todo_lists_create_model.dart';
import 'package:com_cingulo_sample/models/todo/todo_lists_model.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

class TodoRepository extends Repository {
  final PublishSubject<void> _todoUpdated$$ = PublishSubject<void>();
  Stream<void> get todoUpdated$ => _todoUpdated$$.stream;

  final TodoApi _todoApi;

  WrapperTodoListsModel _cache;

  @provide
  @singleton
  TodoRepository(this._todoApi);

  @override
  void postInit() {
    super.postInit();
    disposableFunctions.add(_todoUpdated$$.close);
  }

  @override
  void onRefreshDaily() {
    _cache = null;
  }

  @override
  void onRefreshPeriodically() {
    _cache = null;
  }

  Future<WrapperTodoListsModel> getTodoList() async {
    if (_cache == null) {
      final response = await _todoApi.getTodoLists();
      _cache = TodoListsMapper.responseToModel(response);
    }
    return _cache;
  }

  Future<void> createTodoList(TodoListsCreateModel model) async {
    final request = TodoListsCreateMapper.modelToRequest(model);
    await _todoApi.createList(request, TodoListsCreateMapper.badRequestToModelError);
    _todoUpdated$$.add(null);
    _cache = null;
  }
}
