import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:riverpoddemo/models/user_model.dart';

Future<List<User>> getUsers() async {
  http.Response res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  List<dynamic> response = json.decode(res.body);
  final x = response.map((user) => User.fromJson(user as Map<String, dynamic>)).toList();
  return x;
}