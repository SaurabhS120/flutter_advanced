import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_advanced/getx_ex/home_screen/controller/home_controller.dart';
class DetailsScreen extends StatelessWidget{
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details Screen'),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Details Screen'),
            Obx(() => Text("Count : ${homeController.count}"),),
            ElevatedButton(
                onPressed: (){
                  Get.back();
                  },
                child: Text('Back'),
            ),
            ElevatedButton(
                onPressed: (){
                  homeController.increment();
                  },
                child: Text('Increment'),
            ),
            ElevatedButton(
                onPressed: (){
                  Get.defaultDialog(title: 'This is a dialog example');
                  },
                child: Text('Show Dialog'),
            ),
            ElevatedButton(
                onPressed: (){
                  Get.snackbar('This is a snackbar example', "dummy text",snackPosition: SnackPosition.BOTTOM);
                  },
                child: Text('Show Snackbar'),
            ),
          ],
        ),
      ),
    );
  }

}