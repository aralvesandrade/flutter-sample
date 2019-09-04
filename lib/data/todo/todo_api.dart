import 'package:com_cingulo_sample/data/api_client/api_client.dart';
import 'package:com_cingulo_sample/data/todo/requests/todo_lists_create_request.dart';
import 'package:com_cingulo_sample/data/todo/responses/todo_lists_response.dart';
import 'package:inject/inject.dart';

class TodoApi {
  final ApiClient _apiClient;

  @provide
  @singleton
  TodoApi(this._apiClient);

  Future<WrapperTodoListsResponse> getTodoLists() async {
    final response = await _apiClient.get('/todo/lists/');
    return WrapperTodoListsResponse.fromJson(response.data);
  }

  Future<TodoListsResponse> createList(TodoListsCreateRequest request, Function badRequestToModelError) async {
    final response = await _apiClient.post('/todo/lists/', request.toJson(), badRequestToModelError);
    return TodoListsResponse.fromJson(response.data);
  }
}
