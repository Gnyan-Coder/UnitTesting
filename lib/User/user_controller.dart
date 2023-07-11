import 'dart:convert';

import 'package:unittesting/User/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository{
  final http.Client client;
  UserRepository(this.client);
  Future<UserModel> getUser()async{
    final response=await client.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if(response.statusCode==200){
      return UserModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("something error Occured");
  }

}