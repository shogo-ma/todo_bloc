import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/todo_bloc.dart';
import 'package:todo_bloc/blocs/todo_event.dart';
import 'package:todo_bloc/blocs/todo_state.dart';
import 'package:todo_bloc/models/todo.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController contentController = TextEditingController();

  TodoBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<TodoBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    final inputField = Container(
        width: 380,
        child: TextField(
          controller: contentController,
          maxLines: 4,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: 'input your todo',
            border: OutlineInputBorder(),
          ),
          textAlign: TextAlign.left,
        ));

    final submitButton = RaisedButton(
      child: Text("submit"),
      color: Colors.cyan,
      shape: StadiumBorder(),
      onPressed: () {
        Todo todo = Todo(contentController.text);
        _bloc.add(AddTodo(todo));

        Navigator.pop(context);
      },
    );

    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text("todos"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 100),
              inputField,
              SizedBox(height: 20),
              submitButton,
            ],
          ),
        ),
      );
    });
  }
}
