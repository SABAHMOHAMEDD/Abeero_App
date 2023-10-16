import 'dart:ui';

import '../core/extention.dart';

class ProductModel {
  String? name;
  String? productImage;
  String? description;
  Color? color;
  String? size;
  String? price;

  ProductModel(
      {this.name,
      this.productImage,
      this.description,
      this.color,
      this.size,
      this.price});

  ProductModel.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name'],
          productImage: json['productImage'],
          description: json['description'],
          color: HexColor.fromHex(json['color']),
          size: json['size'],
          price: json['price'],
        );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'productImage': productImage,
      'description': description,
      'color': color,
      'size': size,
      'price': price,
    };
  }
}
