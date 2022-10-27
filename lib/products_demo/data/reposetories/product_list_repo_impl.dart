import 'package:flutter_advanced/products_demo/domain/repositories/product_list_repository.dart';
import 'package:flutter_advanced/products_demo/domain/entity/product_entity.dart';
import 'package:flutter_advanced/products_demo/data/datasources/http_service.dart';
import 'package:flutter_advanced/products_demo/data/model/product_list_model.dart';
class ProductListRepoImpl extends ProductListRepository{
  HttpService httpService= HttpService();
  @override
  Future<List<ProductEntity>> getProductList() async{
    var response = await httpService.getRequest();
    var productList = ProductListModel.fromJson(response.data);
    return productList.toEntity();

  }

}