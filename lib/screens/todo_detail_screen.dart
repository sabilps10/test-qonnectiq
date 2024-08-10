import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo_modal.dart';
import '../providers/todo_provider.dart';

class TodoDetailScreen extends StatelessWidget {
  final Todo todo;

  TodoDetailScreen({required this.todo});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do Detail'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/edit',
                arguments: todo,
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Delete To-Do'),
                  content: Text('Are you sure you want to delete this to-do?'),
                  actions: [
                    TextButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Delete'),
                      onPressed: () {
                        todoProvider.deleteTodo(todo.id);
                        Navigator.of(ctx).pop();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              todo.body,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Completed: ${todo.completed ? "Yes" : "No"}',
                  style: TextStyle(fontSize: 16),
                ),
                Switch(
                  value: todo.completed,
                  onChanged: (value) {
                    final updatedTodo = Todo(
                      id: todo.id,
                      title: todo.title,
                      body: todo.body,
                      completed: value,
                    );
                    todoProvider.updateTodo(todo.id, updatedTodo);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
