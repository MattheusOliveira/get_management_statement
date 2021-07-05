
import 'dart:convert';
import 'package:get_management_statement/data/model/my_model.dart';
import 'package:get_management_statement/data/model/user.dart';
import 'package:http/http.dart' as http;

var baseUrl = Uri.parse('https://jsonplaceholder.typicode.com/posts/');

class MyApiClient {
final http.Client httpClient;

MyApiClient(this.httpClient);

  getAll() async {
    try {
      var response = await httpClient.get(baseUrl);
      if(response.statusCode == 200){
        Iterable jsonResponse = json.decode(response.body);
          List<MyModel> listMyModel = jsonResponse.map((model) => MyModel.fromJson(model)).toList();
        return listMyModel;
      }
    } catch(_){ }
  }

  Future<List<User>> findAll(filter) async {
    var url = Uri.parse('https://5f7cba02834b5c0016b058aa.mockapi.io/api/users?page=${filter.page}&limit=${filter.limit}');

    try {
      var response = await httpClient.get(url);

      if(response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var list = Users.fromJson(jsonResponse);
        return list.users;
      }
    } catch(e) {
      print('erro: $e');
    }
    return [];
  }
  
}