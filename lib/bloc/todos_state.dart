part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosInitial extends TodosState {}

class TodosWating extends TodosState {}

class TodoLoadDone extends TodosState {
  final List<ToDos> todos;

  TodoLoadDone(this.todos);
}

class TodoErrorOccured extends TodosState {
  final String errorMessage;

  TodoErrorOccured(this.errorMessage);
}
