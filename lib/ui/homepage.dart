import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/bloc/todos_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF00beff),
        appBar: AppBar(
          title: Text("Todos With BLOC"),
          backgroundColor: Color(0xFFff8200),
        ),
        body: Center(
          child: BlocBuilder<TodosBloc, TodosState>(
            builder: (context, state) {
              if (state is TodosWating) {
                return CircularProgressIndicator(
                  backgroundColor: Color(0xFF0b0d34),
                  semanticsLabel: "Loading",
                );
              } else if (state is TodoLoadDone) {
                return ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(8),
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Color(0xFF0b0d34),
                        child: ListTile(
                          title: Text(
                            "${state.todos[index].title}\n",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,),
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                "Completed : ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "${state.todos[index].completed}",
                                style: TextStyle(
                                  color: Color(0xFFff8200),
                                  fontSize: 15,
                                fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              } else if (state is TodoErrorOccured) {
                return Column(
                  children: [
                    Icon(Icons.error_outline),
                    Text("ErrorOccured${state.errorMessage}")
                  ],
                );
              }
              return CircularProgressIndicator(
                backgroundColor: Color(0xFF0b0d34),
                semanticsLabel: "Loading",
              );
            },
          ),
        ),
      ),
    );
  }
}
