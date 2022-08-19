import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpoddemo/models/albums_model.dart';
import '../services/albums_service.dart';

final albumsProvider = FutureProvider<List<AlbumsModel>>((ref) {
  return getAlbums();
});

class AlbumsWidget extends ConsumerWidget {
   const AlbumsWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final user = watch(albumsProvider);
    return user.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text(err.toString()),
      data: (data) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.amber,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.collections,size: 72,),
                Text(data[index].title??"",maxLines: 2,overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 14),),
              ],
            ),
          );
        }
      )
    );
  }
}