class TaskRequest {
  final String name;
  final String notes;
  final bool done;

  TaskRequest({this.name, this.notes, this.done});

  Map<String, dynamic> toJson() => {
        'name': name,
        'notes': notes,
        'done': done,
      };
}
