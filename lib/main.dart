import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/bloc/todos_bloc.dart';
import 'package:todos/data/repository/todos_repo.dart';
import 'package:todos/ui/homepage.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDos bloc',
      home: BlocProvider(
        create: (context) => TodosBloc(repository:GetAllTodosImpl())..add(GetTodos()),
        child: HomePage(),
      ),
      
    );
  }
}
