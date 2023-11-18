import 'package:abeero/core/helper/database/fav_database_helper.dart';
import 'package:abeero/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../core/helper/database/cart_database_helper.dart';
import '../core/local_storage_data.dart';
import '../view/Auth/SignIn_view.dart';
import 'cart_view_model.dart';
import 'fav_view_model.dart';

class ProfileViewModel extends GetxController {
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  ValueNotifier<bool> get isLoading => _isLoading;

  final LocalStorageData localStorageData = Get.put(LocalStorageData());
  final CartViewModel cartViewModel = Get.find();
  final FavViewModel favViewModel = Get.find();
  var dbHelperCart = CartDatabaseHelper.db;
  var dbHelperFav = FavDatabaseHelper.db;

  UserModel? userModel;

  getUserData() async {
    _isLoading.value = true;

    await localStorageData.getUserData.then((value) {
      userModel = value ?? UserModel();
    });
    if (kDebugMode) {
      print("get user data here>>>>>>>>>>>>>>>>>>>>>>>>>");
    }
    if (kDebugMode) {
      print(userModel?.name);
      print(userModel?.email);
      print(userModel?.userId);
    }
    _isLoading.value = false;

    update();
  }

  Future<void> signOut() async {
    // delete user from shared prefs

    CartDatabaseHelper.clearCartDatabase();
    FavDatabaseHelper.clearFavDatabase();
    localStorageData.deleteUserData();
    cartViewModel.getCartProducts();
    favViewModel.getFavProducts();
    GoogleSignIn().disconnect();
    localStorageData.getUserData;
    FirebaseAuth.instance.signOut();

    Get.offAll(SignInView());
  }
}
