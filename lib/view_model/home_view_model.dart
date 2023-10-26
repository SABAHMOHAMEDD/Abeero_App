import 'package:abeero/model/product_model.dart';
import 'package:abeero/view_model/profile_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/helper/services/firestore_home.dart';
import '../model/category_model.dart';

class HomeViewModel extends GetxController {
  final ProfileViewModel profileViewModel = Get.find();

  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  ValueNotifier<bool> get isLoading => _isLoading;

  final List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  final List<ProductModel> _productModel = [];
  List<ProductModel> get productModel => _productModel;

  HomeViewModel() {
    getCategory();
    getNewRelease();
  }

  getCategory() async {
    _isLoading.value = true;
    HomeServices().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoryModel.fromJson(value[i].data() as Map<String, dynamic>));
        _isLoading.value = false;
      }
      update();
    });
  }

  getNewRelease() async {
    _isLoading.value = true;
    HomeServices().getNewRelease().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(
            ProductModel.fromJson(value[i].data() as Map<String, dynamic>));
        _isLoading.value = false;
      }
      update();
    });
  }

  void getUserData() async {
    await profileViewModel.getUserData();
  }
}
