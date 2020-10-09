import 'dart:convert';
import 'package:http/http.dart';
import 'package:todos/data/model/todos_api.dart';

abstract class TodosRepo {
  Future<List<ToDos>>getTodos();
  
}

class GetAllTodosImpl extends TodosRepo {
   // A function that converts a response body into a List<vidoeModel>.
  List<ToDos> parsetodos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<ToDos>((json) => ToDos.fromJson(json)).toList();
  }
  @override
  Future<List<ToDos>> getTodos() async {
    final response = await get("https://jsonplaceholder.typicode.com/todos");
    if (response.statusCode==200||response.statusCode==201) {
      return parsetodos(response.body);    
    } else {
       throw Exception('=======Can not load todos from api');
    }
  }
}