
import 'package:api_study/model.dart';
import 'package:dio/dio.dart';

class TodoRepository{

  final dio = Dio();

  Future<List<Todos>> getTodos() async {

    List<Todos> listTodos = [];

    final response = await dio.get('https://jsonplaceholder.typicode.com/todos');
    final data = response.data;

    for (int i=0; i<data.length; i++){
      Map<String,dynamic> object = data[i];
      Todos toDo = Todos.fromJson(object);
      listTodos.add(toDo);
    }

    return listTodos;
  }
}