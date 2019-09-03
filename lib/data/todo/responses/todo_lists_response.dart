class WrapperTodoListsResponse {
  final List<TodoListsResponse> list;

  WrapperTodoListsResponse.fromJson(dynamic json) : list = (json as List).map((item) => TodoListsResponse.fromJson(item)).toList();
}

class TodoListsResponse {
  final String url;
  final String id;
  final String name;

  TodoListsResponse.fromJson(Map<String, dynamic> json)
      : url = json['url'],
        id = json['id'],
        name = json['name'];
}
