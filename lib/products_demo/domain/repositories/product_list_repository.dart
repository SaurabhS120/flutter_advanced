import 'package:flutter_advanced/products_demo/domain/entity/product_entity.dart';
abstract class ProductListRepository{
  Future<List<ProductEntity>> getProductList();
}