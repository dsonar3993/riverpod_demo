import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:riverpoddemo/models/todos_model.dart';

Future<List<TodosModel>> getTodos() async {
  http.Response res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

  List<dynamic> response = json.decode(res.body);
  final x = response.map((user) => TodosModel.fromJson(user as Map<String, dynamic>)).toList();
  return x;
}