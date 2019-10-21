import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/todo_bloc.dart';
import 'package:todo_bloc/blocs/todo_event.dart';
import 'package:todo_bloc/blocs/todo_state.dart';
import 'package:todo_bloc/models/todo.dart';

class DetailScreen extends StatelessWidget {
  final Todo todo;

  DetailScreen({this.todo});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text("todo"),
            ),
            body: Center(
                child: Column(
              children: <Widget>[
                SizedBox(height: 100),
                Text("${todo.id}"),
                SizedBox(height: 20),
                Text("${todo.content}"),
                SizedBox(height: 20),
                RaisedButton(
                  child: Text("delete"),
                  onPressed: () {
                    BlocProvider.of<TodoBloc>(context).add(DeleteTodo(todo));
                    Navigator.pop(context);
                  },
                ),
              ],
            )));
      },
    );
  }
}
