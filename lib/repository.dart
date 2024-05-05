
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



class ApiV4{


  final dio = Dio();

  Future<String> auth(String login, String password, String idpc) async {

    Map<String, dynamic> data = {
      'username': login,
      'password': password,
    };

    Map<String, dynamic> headers = {
      'Content-Type':'application/json',
      'Accept':'application/json',
      'CashBox-Token': idpc
    };

    final response = await dio.post(
      'https://crs-api.wiseweb.by/apiv4/auth/',
      data: data,
      options: Options(headers: headers)
    );

    print(response.data['token']);

    return 'sdg';
  }


}