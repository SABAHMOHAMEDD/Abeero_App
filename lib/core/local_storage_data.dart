import 'dart:convert';

import 'package:abeero/model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class LocalStorageData extends GetxController {
  Future<UserModel?> get getUserData async {
    try {
      UserModel userModel = await _getUserData();

      return userModel;
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return null;
    }
  }

  _getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var value = preferences.getString(CACHED_USER_DATA);
    return UserModel.fromJson(json.decode(value!));
  }

  setUserData(UserModel userModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(
        CACHED_USER_DATA, json.encode(userModel.toJson()));
  }

  void deleteUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear().then((value) {
      print("Clearing the cache>>>>>>>>>>>>>>>>>>>>>>>>>>");
      print(value);
    });
  }
}
