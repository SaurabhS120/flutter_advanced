import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_advanced/products_demo/domain/entity/product_entity.dart';
part 'product_model.g.dart';
@JsonSerializable()
class ProductModel{
  @JsonValue('title')
  String title;
  @JsonValue('description')
  String description;
  @JsonValue('price')
  int price;

  ProductModel({required this.title,required this.description,required this.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  ProductEntity toEntity(){
    return ProductEntity(title, description, price);
  }

}