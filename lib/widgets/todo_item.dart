import 'package:flutter/material.dart';
import 'package:todo_bloc/models/todo.dart';

class TodoItem extends StatelessWidget {
  final VoidCallback onItemTap;

  final Todo todo;

  TodoItem({this.todo, this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black)),
        ),
        child: ListTile(
          title: Text(todo.content),
          onTap: onItemTap,
        ));
  }
}
