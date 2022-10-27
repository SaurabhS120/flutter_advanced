import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_advanced/products_demo/presentation/products_screens.dart';
import 'package:flutter_advanced/products_demo/presentation/controller/products_controller.dart';
import 'package:flutter_advanced/products_demo/domain/repositories/product_list_repository.dart';
import 'package:flutter_advanced/products_demo/data/reposetories/product_list_repo_impl.dart';

void main(){
  final ProductListRepository productListRepository = ProductListRepoImpl();
  Get.put(productListRepository);
  Get.put(ProductsController());
  runApp(
      GetMaterialApp(
        home: ProductWidget(),
      )
  );
}