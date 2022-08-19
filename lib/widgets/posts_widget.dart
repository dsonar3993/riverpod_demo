import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpoddemo/models/post_model.dart';
import 'package:riverpoddemo/services/posts_service.dart';

final postsProvider = FutureProvider<List<PostModel>>((ref) {
  return getPosts();
});

class PostsWidget extends ConsumerWidget {
   const PostsWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final user = watch(postsProvider);
    return user.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text(err.toString()),
      data: (data) => ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(height: 5.0,);
        },
        itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
          child: ListTile(
              title: Text(data[index].title??""),
              subtitle: Text(data[index].body??""),
          ),
        );
          }
      )
    );
  }
}