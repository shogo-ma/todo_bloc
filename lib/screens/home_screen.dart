import 'package:flutter/material.dart';
import 'package:todo_bloc/screens/add_todo_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("todos"),
      ),
      body: ListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTodoScreen()));
        },
      ),
    );
  }
}
