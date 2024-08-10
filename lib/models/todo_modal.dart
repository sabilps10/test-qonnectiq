class Todo {
  int id;
  String title;
  String body;
  bool completed;

  Todo({
    required this.id,
    required this.title,
    required this.body,
    this.completed = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      completed: json['completed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'completed': completed,
    };
  }
}
