import 'package:flutter_advanced/products_demo/domain/entity/product_entity.dart';
import 'package:flutter_advanced/products_demo/domain/repositories/product_list_repository.dart';
class ProductListUsecase{

  ProductListRepository repo;
  ProductListUsecase(this.repo);

  Future<List<ProductEntity>> invoke() async{
    return await repo.getProductList();
  }

}