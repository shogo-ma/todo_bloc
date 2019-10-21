/*
 * The file is:
 * Copyright (c) 2018 Felix Angelov
 * Released under the MIT license.
 * see https://opensource.org/licenses/MIT
*/

import 'package:equatable/equatable.dart';
import 'package:todo_bloc/models/todo.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class LoadTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final Todo todo;

  const AddTodo(this.todo);

  @override
  List<Object> get props => [todo];
}
