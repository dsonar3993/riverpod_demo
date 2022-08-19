import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpoddemo/models/todos_model.dart';
import 'package:riverpoddemo/services/todos_service.dart';

final todosProvider = FutureProvider<List<TodosModel>>((ref) {
  return getTodos();
});

class TodosWidget extends ConsumerWidget {
   const TodosWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final user = watch(todosProvider);
    return user.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text(err.toString()),
      data: (data) => ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(height: 5.0,);
        },
        itemCount: data.length,
          itemBuilder: (context, index) {
          return SwitchListTile(
            title: Text(data[index].title??""),
            onChanged: (val){},
            value: data[index].completed??false,
        );
          }
      )
    );
  }
}