class ProductModel {
  String? name;
  String? productImage;
  String? description;
  String? color;
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
          color: json['color'],
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
