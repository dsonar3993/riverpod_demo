import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpoddemo/widgets/users_widget.dart';

import 'widgets/albums_widget.dart';
import 'widgets/photos_widget.dart';
import 'widgets/posts_widget.dart';
import 'widgets/todos_widget.dart';

void main() {
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RiverPod Demo"),
        centerTitle: true,
      ),
      body: 
      activeIndex==0?
      const PostsWidget():
      activeIndex==1?
      const AlbumsWidget():
      activeIndex==2?
      const PhotosWidget():
      activeIndex==3?
      const TodosWidget():
      activeIndex==4?
      const UsersWidget():
      const SizedBox.shrink(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index)=>setState(() {activeIndex=index;}),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.newspaper),label: "Posts",backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.photo_album),label: "Albums"),
          BottomNavigationBarItem(icon: Icon(Icons.photo),label: "Photos"),
          BottomNavigationBarItem(icon: Icon(Icons.checklist),label: "ToDo List"),
          BottomNavigationBarItem(icon: Icon(Icons.people),label: "Users")
        ],
      ),
    );
  }
}