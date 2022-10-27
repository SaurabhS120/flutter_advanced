import 'package:flutter_advanced/getx_ex/home_screen/binding/home_binding.dart';
import 'package:flutter_advanced/getx_ex/home_screen/controller/home_controller.dart';
import 'package:get/get.dart';
class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}