import 'package:dio/dio.dart';
class HttpService{
  late Dio _dio;
  final String base_url = 'https://dummyjson.com';
  HttpService(){
    _dio = Dio(
      BaseOptions(baseUrl: base_url),
    );
  }
  Future<Response> getRequest() async{
    Response response;
    try{
      response = await _dio.get('/products');
      print(response);
      return response;
    }on DioError catch(e){
      print(e);
      throw Exception(e.message);
    }
    // try {
    //   var response = await Dio().get('https://dummyjson.com/users');
    //   print(response);
    //   return response;
    // } catch (e) {
    //   print(e);
    //   rethrow;
    // }
  }
}