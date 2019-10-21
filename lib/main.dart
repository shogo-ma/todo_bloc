import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/todo_bloc.dart';
import 'package:todo_bloc/blocs/todo_event.dart';
import 'package:todo_bloc/repositories/todo.dart';
import 'package:todo_bloc/screens/home_screen.dart';

void main() => runApp(BlocProvider(
    builder: (context) {
      return TodoBloc(todoRepository: TodoRepositoryImpl())..add(LoadTodos());
    },
    child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
