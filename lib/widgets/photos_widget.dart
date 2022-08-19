import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpoddemo/models/photos_model.dart';
import 'package:riverpoddemo/services/photos_service.dart';

final photosProvider = FutureProvider<List<PhotosModel>>((ref) {
  return getPhotos();
});

class PhotosWidget extends ConsumerWidget {
   const PhotosWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final user = watch(photosProvider);
    return user.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text(err.toString()),
      data: (data) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: 10,
          itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.network(data[index].thumbnailUrl??"",scale: 0.25,),
              Container(
                color: Colors.white.withOpacity(0.25), 
                padding: const EdgeInsets.all(4),
                child: Text(data[index].title??"",maxLines: 2,textAlign: TextAlign.center,style: const TextStyle(fontSize: 12),))
            ],
        ),
          );
          }
      )
    );
  }
}