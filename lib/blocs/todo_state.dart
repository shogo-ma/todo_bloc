/*
 * The file is:
 * Copyright (c) 2018 Felix Angelov
 * Released under the MIT license.
 * see https://opensource.org/licenses/MIT
*/

import 'package:equatable/equatable.dart';
import 'package:todo_bloc/models/todo.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodosLoading extends TodoState {}

class TodosLoaded extends TodoState {
  final List<Todo> todos;

  const TodosLoaded([this.todos = const []]);

  @override
  List<Object> get props => [todos];
}

class TodosNotLoaded extends TodoState {}
