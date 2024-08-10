import 'package:flutter/material.dart';
import '../models/todo_modal.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  TodoItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      subtitle: Text(todo.body),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: todo);
      },
    );
  }
}
