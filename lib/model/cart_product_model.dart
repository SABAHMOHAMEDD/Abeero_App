class CartProductModel {
  String? name;
  String? productImage;
  int? quantity;
  String? price;
  String? productId;

  CartProductModel(
      {required this.name,
      required this.productImage,
      required this.quantity,
      required this.price,
      required this.productId});

  CartProductModel.fromJson(Map<dynamic, dynamic> json)
      : this(
          name: json['name'],
          productImage: json['productImage'],
          quantity: json['quantity'],
          price: json['price'],
          productId: json['productId'],
        );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'productImage': productImage,
      'quantity': quantity,
      'price': price,
      'productId': productId,
    };
  }
}
