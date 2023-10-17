import 'package:abeero/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../core/local_storage_data.dart';

class ProfileViewModel extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
      getCurrentUser();
  }


  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  ValueNotifier<bool> get isLoading => _isLoading;
  UserModel get userModel => _userModel;
  late UserModel _userModel;
  //final LocalStorageData localStorageData = Get.put(LocalStorageData());
  final LocalStorageData localStorageData = Get.find();
  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    // delete user from shared prefs
    localStorageData.deleteUserData();
  }

  getCurrentUser() async {
    _isLoading.value = true;

    await localStorageData.getUserData.then((value) {
      _userModel = value!;
    });
    _isLoading.value = false;

    update();
  }
}
