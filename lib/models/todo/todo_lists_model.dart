class WrapperTodoListsModel {
  final List<TodoListsModel> list;

  WrapperTodoListsModel(this.list);
}

class TodoListsModel {
  final String url;
  final String id;
  final String name;

  TodoListsModel({this.url, this.id, this.name});
}
