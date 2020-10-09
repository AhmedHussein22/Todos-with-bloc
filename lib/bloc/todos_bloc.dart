import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todos/data/model/todos_api.dart';
import 'package:todos/data/repository/todos_repo.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodosRepo repository;
  TodosBloc({this.repository}) : super(TodosInitial());

  @override
  Stream<TodosState> mapEventToState(
    TodosEvent event,
  ) async* {
    if(event is GetTodos){
      yield TodosWating();
      try {
        final todos= await repository.getTodos();
        yield TodoLoadDone(todos);
      } catch (e) {
        yield TodoErrorOccured(e.toString());

      }
    }
  }
}
