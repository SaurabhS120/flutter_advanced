import 'dart:convert';

import 'package:dio/dio.dart';
class HttpService{
  late Dio _dio;
  final String base_url = 'https://reqres.in/';
  HttpService(){
    _dio = Dio(
      BaseOptions(baseUrl: base_url),
    );
  }
  Future<Response> postRequest() async{
    Response response;
    try{
      var dataJson = {"email": "eve.holt@reqres.in", "password": "cityslicka"};
      response = await _dio.post(
          'api/login/',
          data: json.encode(dataJson),
      );
      print(response);
      return response;
    }on DioError catch(e){
      print(e);
      throw Exception(e.message);
    }
  }
}
void main() async{
  var httpService = HttpService();
  var response = await httpService.postRequest();
  print(response.data);
}