class TodoListsCreateRequest {
  final String name;

  TodoListsCreateRequest(this.name);

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
