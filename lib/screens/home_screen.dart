import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/todo_bloc.dart';
import 'package:todo_bloc/blocs/todo_state.dart';
import 'package:todo_bloc/screens/add_todo_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      if (state is TodosLoading) {
        return Scaffold(
          appBar: AppBar(
            title: Text("not loaded"),
          ),
        );
      } else if (state is TodosLoaded) {
        final todos = state.todos.map((f) => Text(f.content)).toList();
        return Scaffold(
          appBar: AppBar(
            title: Text("todos"),
          ),
          body: ListView(
            children: todos,
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddTodoScreen()));
            },
          ),
        );
      }
    });
  }
}
