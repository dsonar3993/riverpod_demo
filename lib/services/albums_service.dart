import 'package:http/http.dart' as http;
import 'package:riverpoddemo/models/albums_model.dart';
import 'dart:convert';

Future<List<AlbumsModel>> getAlbums() async {
  http.Response res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

  List<dynamic> response = json.decode(res.body);
  final x = response.map((user) => AlbumsModel.fromJson(user as Map<String, dynamic>)).toList();
  return x;
}