import 'package:todo_bloc/models/todo.dart';
import 'package:todo_bloc/store.dart';

abstract class TodoRepository {
  List<Todo> findAll();

  void add(Todo todo);
  void addAll(List<Todo> todos);
  void delete(Todo todo);
}

class TodoRepositoryImpl extends TodoRepository {
  final Store store;

  TodoRepositoryImpl({this.store});

  List<Todo> findAll() {
    return this.store.get();
  }

  void add(Todo todo) {
    this.store.add(todo);
  }

  void addAll(List<Todo> todos) {
    this.store.addAll(todos);
  }

  void delete(Todo todo) {
    this.store.delete(todo);
  }
}
