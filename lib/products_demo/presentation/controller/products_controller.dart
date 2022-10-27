import 'package:flutter_advanced/products_demo/domain/entity/product_entity.dart';
import 'package:get/get.dart';
import 'package:flutter_advanced/products_demo/domain/repositories/product_list_repository.dart';
class ProductsController extends GetxController{
  final ProductListRepository productListRepository = Get.find<ProductListRepository>();
  Future<List<ProductEntity>> getItems(){
    var products = productListRepository.getProductList();
    return products;
  }

}