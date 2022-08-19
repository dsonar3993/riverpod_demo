import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../services/users_service.dart';

final personProvider = FutureProvider<List<User>>((ref) {
  return getUsers();
});

class UsersWidget extends ConsumerWidget {
   const UsersWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final user = watch(personProvider);
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(flex:1, child: Text("Name: ",style: TextStyle(fontWeight: FontWeight.bold),)),
                      Expanded(flex:3, child: Text(data[index].name.toString()))
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      const Expanded(flex:1, child: Text("Username: ",style: TextStyle(fontWeight: FontWeight.bold),)),
                      Expanded(flex:3, child: Text(data[index].username.toString()))
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      const Expanded(flex:1, child: Text("E-mail: ",style: TextStyle(fontWeight: FontWeight.bold),)),
                      Expanded(flex:3, child: Text(data[index].email.toString()))
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      const Expanded(flex:1, child: Text("Phone: ",style: TextStyle(fontWeight: FontWeight.bold),)),
                      Expanded(flex:3, child: Text(data[index].phone.toString()))
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      const Expanded(flex:1, child: Text("Website: ",style: TextStyle(fontWeight: FontWeight.bold),)),
                      Expanded(flex:3, child: Text(data[index].website.toString()))
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(flex:1, child: Text("Address: ",style: TextStyle(fontWeight: FontWeight.bold),)),
                      Expanded(flex:3, child: Text(data[index].address!.street.toString()+", "+
                        data[index].address!.suite.toString()+", "+
                        data[index].address!.city.toString()+", "+
                        data[index].address!.zipcode.toString()+"."))
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(flex:1, child: Text("Company: ",style: TextStyle(fontWeight: FontWeight.bold),)),
                      Expanded(flex:3, child: Text(data[index].company!.name.toString()+", "+
                    data[index].company!.catchPhrase.toString()+", "+
                    data[index].company!.bs.toString()))
                    ],
                  ),
                ],
            ),
          ),
        );
          }
      )
    );
  }
}