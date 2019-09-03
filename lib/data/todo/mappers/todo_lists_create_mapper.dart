import 'package:com_cingulo_sample/data/api_client/errors/bad_request_error.dart';
import 'package:com_cingulo_sample/data/todo/requests/todo_lists_create_request.dart';
import 'package:com_cingulo_sample/models/todo/todo_lists_create_model.dart';

class TodoListsCreateMapper {
  static TodoListsCreateRequest modelToRequest(TodoListsCreateModel model) => TodoListsCreateRequest(model.name);

  static TodoListsCreateModelError badRequestToModelError(BadRequestError error) {
    return TodoListsCreateModelError(
      generic: error.generic(),
      name: error.key('name'),
    );
  }
}
