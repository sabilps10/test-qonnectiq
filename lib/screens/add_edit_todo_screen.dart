import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo_modal.dart';
import '../providers/todo_provider.dart';

class AddEditTodoScreen extends StatefulWidget {
  final Todo? todo;

  AddEditTodoScreen({this.todo});

  @override
  _AddEditTodoScreenState createState() => _AddEditTodoScreenState();
}

class _AddEditTodoScreenState extends State<AddEditTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _body;

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      _title = widget.todo!.title;
      _body = widget.todo!.body;
    } else {
      _title = '';
      _body = '';
    }
  }

  void _saveTodo() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final todoProvider = Provider.of<TodoProvider>(context, listen: false);

      if (widget.todo != null) {
        final updatedTodo = Todo(
          id: widget.todo!.id,
          title: _title,
          body: _body,
          completed: widget.todo!.completed,
        );
        todoProvider.updateTodo(widget.todo!.id, updatedTodo);
      } else {
        final newTodo = Todo(
          id: DateTime.now().millisecondsSinceEpoch,
          title: _title,
          body: _body,
        );
        todoProvider.addTodo(newTodo);
      }

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.todo != null ? 'Edit To-Do' : 'Add To-Do'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              TextFormField(
                initialValue: _body,
                decoration: InputDecoration(labelText: 'Body'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a body';
                  }
                  return null;
                },
                onSaved: (value) {
                  _body = value!;
                },
                maxLines: 3,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveTodo,
                child: Text(widget.todo != null ? 'Update To-Do' : 'Add To-Do'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
