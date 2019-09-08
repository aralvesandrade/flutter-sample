import 'package:com_cingulo_sample/data/api_client/errors/bad_request_error.dart';
import 'package:com_cingulo_sample/data/todo/requests/task_request.dart';
import 'package:com_cingulo_sample/data/todo/responses/task_response.dart';
import 'package:com_cingulo_sample/models/todo/task_model.dart';

class TaskMapper {
  static TaskRequest modelToRequest(TaskModel model) {
    return TaskRequest(
      name: model.name,
      notes: model.notes == null ? '' : model.notes,
      done: model.done == null ? false : model.done,
    );
  }

  static TaskModel responseToModel(TaskResponse response) {
    return TaskModel(
      id: response.id,
      name: response.name,
      notes: response.notes,
      done: response.done,
    );
  }

  static List<TaskModel> responseListToModelList(List<TaskResponse> response) {
    return response
        .map(
          (taskReponse) => TaskModel(
            id: taskReponse.id,
            name: taskReponse.name,
            notes: taskReponse.notes,
            done: taskReponse.done,
          ),
        )
        .toList();
  }

  static TaskModelError badRequestToModelError(BadRequestError error) {
    return TaskModelError(
      generic: error.generic(),
      name: error.key('name'),
    );
  }
}
