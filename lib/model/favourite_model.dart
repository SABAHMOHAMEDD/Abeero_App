class FavouriteModel {
  String? name;
  String? productImage;
  String? price;
  String? productId;

  FavouriteModel(
      {required this.name,
      required this.productImage,
      required this.price,
      required this.productId});

  FavouriteModel.fromJson(Map<dynamic, dynamic> json)
      : this(
          name: json['name'],
          productImage: json['productImage'],
          price: json['price'],
          productId: json['productId'],
        );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'productImage': productImage,
      'price': price,
      'productId': productId,
    };
  }
}
