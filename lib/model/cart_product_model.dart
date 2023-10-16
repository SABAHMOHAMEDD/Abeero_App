class CartProductModel {
  String? name;
  String? productImage;
  int? quantity;
  String? price;

  CartProductModel({required this.name, required this.productImage,required this.quantity,  required this.price});

  CartProductModel.fromJson(Map<dynamic, dynamic> json)
      : this(
          name: json['name'],
          productImage: json['productImage'],
          quantity: json['quantity'],
          price: json['price'],
        );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'productImage': productImage,
      'quantity': quantity,
      'price': price,
    };
  }
}
