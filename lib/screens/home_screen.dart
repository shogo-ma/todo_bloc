import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/todo_bloc.dart';
import 'package:todo_bloc/blocs/todo_event.dart';
import 'package:todo_bloc/blocs/todo_state.dart';
import 'package:todo_bloc/screens/add_todo_screen.dart';
import 'package:todo_bloc/screens/detail_screen.dart';
import 'package:todo_bloc/widgets/todo_item.dart';

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
        debugPrint("${state.toString()}");
        final todos = state.todos;
        return Scaffold(
          appBar: AppBar(
            title: Text("todos"),
          ),
          body: ListView.builder(
              itemBuilder: (context, index) {
                return TodoItem(
                  todo: todos[index],
                  onItemTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(todo: todos[index])));
                  },
                );
              },
              itemCount: todos.length),
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
