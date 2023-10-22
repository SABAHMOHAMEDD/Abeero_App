import 'package:abeero/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../core/local_storage_data.dart';

class ProfileViewModel extends GetxController {
  ValueNotifier<bool> _isLoading = ValueNotifier(false);
  ValueNotifier<bool> get isLoading => _isLoading;

  final LocalStorageData localStorageData = Get.put(LocalStorageData());

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
    }
    _isLoading.value = false;

    update();
  }

  Future<void> signOut() async {
    // delete user from shared prefs

    localStorageData.deleteUserData();

    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }
}
