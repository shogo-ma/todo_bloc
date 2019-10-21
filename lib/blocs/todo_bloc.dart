/*
 * The file is:
 * Copyright (c) 2018 Felix Angelov
 * Released under the MIT license.
 * see https://opensource.org/licenses/MIT
*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:todo_bloc/blocs/todo_event.dart';
import 'package:todo_bloc/blocs/todo_state.dart';
import 'package:todo_bloc/models/todo.dart';
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
      case AddTodo:
        yield* _mapAddTodoEventToState(event);
        break;
      case DeleteTodo:
        yield* _mapDeleteTodoEventToState(event);
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

  Stream<TodoState> _mapAddTodoEventToState(AddTodo event) async* {
    if (state is TodosLoaded) {
      final List<Todo> todos = List.from((state as TodosLoaded).todos)
        ..add(event.todo);
      yield TodosLoaded(todos);
      this.todoRepository.add(event.todo);
    }
  }

  Stream<TodoState> _mapDeleteTodoEventToState(DeleteTodo event) async* {
    if (state is TodosLoaded) {
      final List<Todo> todos = (state as TodosLoaded)
          .todos
          .where((todo) => todo.id != event.todo.id)
          .toList();
      yield TodosLoaded(todos);
      this.todoRepository.delete(event.todo);
    }
  }
}
