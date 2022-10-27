import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen/view/home_screen.dart';
import 'details_screen/view/details_screen.dart';
import 'package:flutter_advanced/getx_ex/home_screen/binding/home_binding.dart';
void main(){
  runApp(MainApp());
}
class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: HomeScreen(),
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => HomeScreen(),binding: HomeBinding()),
        GetPage(name: '/details', page: () => DetailsScreen(),binding: HomeBinding()),
      ],
    );
  }

}