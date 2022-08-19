import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:riverpoddemo/models/photos_model.dart';

Future<List<PhotosModel>> getPhotos() async {
  http.Response res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  List<dynamic> response = json.decode(res.body);
  final x = response.map((user) => PhotosModel.fromJson(user as Map<String, dynamic>)).toList();
  return x;
}