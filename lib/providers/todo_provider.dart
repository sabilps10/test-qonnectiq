import 'package:flutter/material.dart';
import '../models/todo_modal.dart';
import '../services/todo_service.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = [];
  bool _isLoading = false;

  List<Todo> get todos => _todos;
  bool get isLoading => _isLoading;

  final ApiService _apiService = ApiService();

  Future<void> fetchTodos() async {
    _isLoading = true;
    notifyListeners();
    _todos = await _apiService.fetchTodos();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addTodo(Todo todo) async {
    await _apiService.addTodo(todo);
    _todos.add(todo);
    notifyListeners();
  }

  Future<void> updateTodo(int id, Todo todo) async {
    await _apiService.updateTodo(id, todo);
    int index = _todos.indexWhere((t) => t.id == id);
    if (index != -1) {
      _todos[index] = todo;
      notifyListeners();
    }
  }

  Future<void> deleteTodo(int id) async {
    await _apiService.deleteTodo(id);
    _todos.removeWhere((t) => t.id == id);
    notifyListeners();
  }
}
