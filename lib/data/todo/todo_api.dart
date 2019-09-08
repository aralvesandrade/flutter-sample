import 'package:com_cingulo_sample/data/api_client/api_client.dart';
import 'package:com_cingulo_sample/data/todo/requests/task_request.dart';
import 'package:com_cingulo_sample/data/todo/responses/task_response.dart';
import 'package:inject/inject.dart';

class TodoApi {
  final ApiClient _apiClient;

  @provide
  @singleton
  TodoApi(this._apiClient);

  Future<List<TaskResponse>> getTasks() async {
    final response = await _apiClient.get('/todo/tasks/');
    return TaskResponse.fromJsonList(response.data);
  }

  Future<TaskResponse> getTask(String id) async {
    final response = await _apiClient.get('/todo/tasks/$id/');
    return TaskResponse.fromJson(response.data);
  }

  Future<TaskResponse> createTask(TaskRequest request, Function badRequestToModelError) async {
    final response = await _apiClient.post('/todo/tasks/', request.toJson(), badRequestToModelError);
    return TaskResponse.fromJson(response.data);
  }

  Future<TaskResponse> updateTask(String id, TaskRequest request, Function badRequestToModelError) async {
    final response = await _apiClient.put('/todo/tasks/$id/', request.toJson(), badRequestToModelError);
    return TaskResponse.fromJson(response.data);
  }

  Future<void> deleteTask(String id) async {
    await _apiClient.delete('/todo/tasks/$id/');
  }
}
