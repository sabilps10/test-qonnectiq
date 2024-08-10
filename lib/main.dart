import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/todo_provider.dart';
import 'screens/home_screen.dart';
import 'screens/todo_detail_screen.dart';
import 'screens/add_edit_todo_screen.dart';
import 'models/todo_modal.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/detail': (context) => TodoDetailScreen(
              todo: ModalRoute.of(context)!.settings.arguments as Todo,
            ),
        '/add': (context) => AddEditTodoScreen(),
        '/edit': (context) => AddEditTodoScreen(
              todo: ModalRoute.of(context)!.settings.arguments as Todo,
            ),
      },
    );
  }
}
