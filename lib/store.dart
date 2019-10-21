import 'package:todo_bloc/models/todo.dart';

class Store {
  List<Todo> _todos = [];

  List<Todo> get() => this._todos;

  void add(Todo todo) {
    this._todos.add(todo);
  }

  void addAll(List<Todo> todos) {
    this._todos.addAll(todos);
  }

  void delete(Todo todo) {
    this._todos.removeWhere((item) => item.id == todo.id);
  }

  void deleteAll() {
    this._todos = [];
  }
}
