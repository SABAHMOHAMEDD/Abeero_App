import 'package:abeero/helper/database/cart_database_helper.dart';
import 'package:abeero/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;
  var dbHelper = CartDatabaseHelper.db;

  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;

  CartViewModel() {
    getCartProducts();
    getTotalPrice();
  }

  addProductToCart(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        return;
      }
    }
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);

    _totalPrice += (double.parse(cartProductModel.price!) *
        cartProductModel.quantity!.toInt());
    update();
  }

  getCartProducts() async {
    _loading.value = true;
    _cartProductModel = await dbHelper.getCartProducts();
    print(_cartProductModel.length);
    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price!) *
          _cartProductModel[i].quantity!.toInt());
      print(_totalPrice);
      update();
    }
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity =
        (_cartProductModel[index].quantity! + 1);
    _totalPrice += (double.parse(_cartProductModel[index].price!));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    _cartProductModel[index].quantity =
        (_cartProductModel[index].quantity! - 1);
    _totalPrice -= (double.parse(_cartProductModel[index].price!));
    await dbHelper.updateProduct(_cartProductModel[index]);

    update();
  }
}
