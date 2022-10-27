import 'package:dio/dio.dart';
void getHttp() async {
  try {
    var response = await Dio().get('https://dummyjson.com/users');
    print(response);
  } catch (e) {
    print(e);
  }
}
void main(){
  getHttp();
}