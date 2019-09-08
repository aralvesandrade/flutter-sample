class TaskResponse {
  final String id;
  final String name;
  final String notes;
  final bool done;

  TaskResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        notes = json['notes'],
        done = json['done'];

  static List<TaskResponse> fromJsonList(dynamic json) {
    return (json as List).map((task) => TaskResponse.fromJson(task)).toList();
  }
}
