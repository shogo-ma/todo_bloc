import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:todo_bloc/blocs/todo_event.dart';
import 'package:todo_bloc/blocs/todo_state.dart';
import 'package:todo_bloc/repositories/todo.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;

  TodoBloc({this.todoRepository});

  @override
  TodoState get initialState => TodosLoading();

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    switch (event.runtimeType) {
      case LoadTodos:
        yield* _mapLoadEventToState(event);
        break;
    }
  }

  Stream<TodoState> _mapLoadEventToState(LoadTodos event) async* {
    try {
      final todos = this.todoRepository.findAll();
      yield TodosLoaded(todos);
    } catch (_) {
      yield TodosNotLoaded();
    }
  }
}
