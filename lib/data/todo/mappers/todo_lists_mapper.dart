import 'package:com_cingulo_sample/data/todo/responses/todo_lists_response.dart';
import 'package:com_cingulo_sample/models/todo/todo_lists_model.dart';

class TodoListsMapper {
  static WrapperTodoListsModel responseToModel(WrapperTodoListsResponse response) => WrapperTodoListsModel(response.list
      .map((item) => TodoListsModel(
            url: item.url,
            id: item.id,
            name: item.name,
          ))
      .toList());
}
