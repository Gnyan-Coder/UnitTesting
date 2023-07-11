import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:unittesting/User/user_controller.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  UserRepository userRepository=UserRepository(Client());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: userRepository.getUser(),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }
            return ListView.builder(
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (context,index){
                final data=snapshot.data!.data![index];
                return ListTile(
                  title: Text(data.email.toString()),
                  leading: CircleAvatar(child: Image.network("${data.avatar}"),),
                );
              });
          }
          ),
      ),
    );
  }
}