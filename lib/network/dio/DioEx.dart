import 'package:flutter/material.dart';
import 'http_service.dart';
import 'user.dart';
import 'user_response.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:Text('Dio example')),
        body:Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: UserDetailsWidget(),
          ),
        )
      ),
    );
  }
}
class UserDetailsWidget extends StatelessWidget{
  HttpService httpService = HttpService();
  Future<List<User>> getUsers() async{
    print('sending network request');
    var response = await httpService.getRequest();
    print('network request complete');
    var user_response = UsersResponse.fromJson(response.data);
    return user_response.users;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: null,
      future: getUsers(),
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return CircularProgressIndicator();
        }else{
          return ListView(
            children: [
              for(User item in snapshot.data??[]) Text(item.userName)
              ]
          );
        }
      },
    );
  }
}