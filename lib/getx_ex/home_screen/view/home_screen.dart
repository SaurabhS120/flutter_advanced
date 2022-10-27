import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_advanced/getx_ex/details_screen/view/details_screen.dart';
import 'package:flutter_advanced/getx_ex/home_screen/controller/home_controller.dart';

class HomeScreen extends StatelessWidget{
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home screen'),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('This is home screen'),
            Obx(() => Text("${homeController.count}")),
            ElevatedButton(
              onPressed: (){
                Get.toNamed('/details');
              },
              child: Text('Go to details'),
            ),
            ElevatedButton(
              onPressed: (){
                homeController.increment();
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}