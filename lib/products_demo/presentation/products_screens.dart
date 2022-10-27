import 'package:flutter/material.dart';
import 'package:flutter_advanced/products_demo/domain/repositories/product_list_repository.dart';
import 'package:flutter_advanced/products_demo/presentation/controller/products_controller.dart';
import 'package:get/get.dart';
class ProductWidget extends StatelessWidget{
  final products_controller = Get.find<ProductsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product list'),),
      body: FutureBuilder(
        future: products_controller.getItems(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            var products = snapshot.data;
            return ListView.builder(
              itemCount: products?.length??0,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return ListTile(title: Text(products?[index].title??''),subtitle: Text("${products?[index].description}\nPrice : \$ ${products?[index].price}"),);
              },
            );
          }
        },
      ),
    );
  }

}