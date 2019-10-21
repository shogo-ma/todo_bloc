import 'package:todo_bloc/models/todo.dart';

abstract class TodoRepository {
  List<Todo> findAll();
}

class TodoRepositoryImpl extends TodoRepository {
  List<Todo> findAll() {
    return [Todo("test1"), Todo("test2")];
  }
}
