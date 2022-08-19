import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:riverpoddemo/models/post_model.dart';

Future<List<PostModel>> getPosts() async {
  http.Response res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  List<dynamic> response = json.decode(res.body);
  final x = response.map((user) => PostModel.fromJson(user as Map<String, dynamic>)).toList();
  return x;
}