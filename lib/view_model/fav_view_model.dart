import 'package:abeero/core/helper/database/fav_database_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/favourite_model.dart';

class FavViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  List<FavouriteModel> _favouriteModel = [];
  List<FavouriteModel> get favouriteModel => _favouriteModel;
  var dbHelper = FavDatabaseHelper.db;

  FavViewModel() {
    getFavProducts();
  }

  addProductToFav(FavouriteModel favouriteModel) async {
    for (int i = 0; i < _favouriteModel.length; i++) {
      if (_favouriteModel[i].productId == favouriteModel.productId) {
        return;
      }
    }
    await dbHelper.insert(favouriteModel);
    _favouriteModel.add(favouriteModel);

    update();
  }

  getFavProducts() async {
    // Check if the database is empty
    bool isDatabaseEmpty = await dbHelper.isFavDatabaseEmpty();
    if (isDatabaseEmpty) {
      _favouriteModel = [];
    } else {
      _favouriteModel = await dbHelper.getFavProducts();
    }
    if (kDebugMode) {
      print("fav list length >>>>>>>>>>>>>>>>>>>>>>>>>>");
      print(_favouriteModel.length);
    }
    update();
  }

  getCartProducts() async {
    // Check if the database is empty
    bool isDatabaseEmpty = await dbHelper.isFavDatabaseEmpty();
    if (isDatabaseEmpty) {
      _favouriteModel = [];
    } else {
      _favouriteModel = await dbHelper.getFavProducts();
    }
    if (kDebugMode) {
      print("cart list length >>>>>>>>>>>>>>>>>>>>>>>>>>");
      print(_favouriteModel.length);
    }

    update();
  }

  deleteProductFromFav(String productId) async {
    await dbHelper.deleteProductFromFavorites(productId);
    _favouriteModel.removeWhere((product) => product.productId == productId);
    update();
  }

  Future<bool> isProductInFavorites(String productId) {
    return dbHelper.isProductInFavorites(productId);
  }
}
