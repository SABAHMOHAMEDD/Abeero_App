import 'package:abeero/model/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../core/constants.dart';
import '../core/helper/database/cart_database_helper.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get addToCartloading => _addToCartloading;
  final ValueNotifier<bool> _addToCartloading = ValueNotifier(false);
  List<CartModel> _cartProductModel = [];
  List<CartModel> get cartProductModel => _cartProductModel;
  var dbHelper = CartDatabaseHelper.db;

  double _totalPrice = 0.0;

  double get totalPrice {
    return _totalPrice; // Return the private variable with a default value of 0
  }

  set totalPrice(double newTotal) {
    if (newTotal >= 0.0) {
      _totalPrice = newTotal;
    }
  }

  CartViewModel() {
    getCartProducts();

    getTotalPrice();
  }

  addProductToCart(CartModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        Get.snackbar('Already Exist', "item is already exist in the cart.",
            instantInit: true,
            duration: const Duration(milliseconds: 2500),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            isDismissible: true,
            colorText: CupertinoColors.white,
            snackPosition: SnackPosition.TOP,
            backgroundColor: KPrimaryColor.withOpacity(.85),
            animationDuration: const Duration(milliseconds: 500));

        return;
      }
    }
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    Get.snackbar('Added', "item added successfully to the cart.",
        instantInit: true,
        duration: const Duration(milliseconds: 2500),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        isDismissible: true,
        colorText: CupertinoColors.white,
        snackPosition: SnackPosition.TOP,
        backgroundColor: KPrimaryColor.withOpacity(.85),
        animationDuration: const Duration(milliseconds: 500));

    _totalPrice += (double.parse(cartProductModel.price!) *
        cartProductModel.quantity.toInt());
    update();
  }

  getCartProducts() async {
    _addToCartloading.value = true;

    // Check if the database is empty
    bool isDatabaseEmpty = await dbHelper.isCartDatabaseEmpty();
    if (isDatabaseEmpty) {
      _cartProductModel = [];
    } else {
      _cartProductModel = await dbHelper.getCartProducts();
    }
    if (kDebugMode) {
      print("cart list length >>>>>>>>>>>>>>>>>>>>>>>>>>");

      print(_cartProductModel.length);
    }
    _addToCartloading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price!) *
          _cartProductModel[i].quantity.toInt());
      if (kDebugMode) {
        print(_totalPrice);
      }
      update();
    }
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity = (_cartProductModel[index].quantity + 1);

    _totalPrice += (double.parse(_cartProductModel[index].price!));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    if (_cartProductModel[index].quantity > 1) {
      _cartProductModel[index].quantity =
          (_cartProductModel[index].quantity - 1);

      _totalPrice -= (double.parse(_cartProductModel[index].price!));
      await dbHelper.updateProduct(_cartProductModel[index]);

      update();
    }
  }

  deleteProductFromCart(String productId, int index) async {
    _totalPrice -= (double.parse(_cartProductModel[index].price!)) *
        _cartProductModel[index].quantity;
    await dbHelper.deleteProductFromCart(productId);
    _cartProductModel.removeWhere((product) => product.productId == productId);
    Get.snackbar('Deleted', "item deleted from the Cart.",
        instantInit: true,
        duration: const Duration(milliseconds: 2500),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        isDismissible: true,
        colorText: CupertinoColors.white,
        snackPosition: SnackPosition.TOP,
        backgroundColor: KPrimaryColor.withOpacity(.85),
        animationDuration: const Duration(milliseconds: 500));

    update();
  }
}
