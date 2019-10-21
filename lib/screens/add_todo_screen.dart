import 'package:flutter/material.dart';

class AddTodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inputField = Container(
        width: 380,
        child: TextField(
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
      onPressed: () {},
    );

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
  }
}
