import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_advanced/products_demo/domain/entity/product_entity.dart';
import 'package:flutter_advanced/products_demo/data/model/product_model.dart';
part 'product_list_model.g.dart';
@JsonSerializable()
class ProductListModel{
  @JsonValue('title')
  List<ProductModel> products;

  ProductListModel({required this.products});

  factory ProductListModel.fromJson(Map<String, dynamic> json) => _$ProductListModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductListModelToJson(this);

  List<ProductEntity> toEntity(){
    return products.map((p) => ProductEntity(p.title, p.description, p.price)).toList();
  }

}