import 'package:abeero/model/product_model.dart';
import 'package:abeero/view_model/profile_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../core/helper/services/firestore_home.dart';
import '../model/category_model.dart';

class HomeViewModel extends GetxController {
  final ProfileViewModel profileViewModel = Get.find();

  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  ValueNotifier<bool> get isLoading => _isLoading;

  final ValueNotifier<bool> _isLoadingCat = ValueNotifier(false);
  ValueNotifier<bool> get isLoadingCat => _isLoadingCat;
  // final ValueNotifier<bool> _isLoadingSearch = ValueNotifier(false);
  // ValueNotifier<bool> get isLoadingSearch => _isLoadingSearch;
  var isLoadingSearch = false.obs;

  final List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  final List<ProductModel> _productModel = [];
  List<ProductModel> get productModel => _productModel;

  List<ProductModel> _productModelCat = [];
  List<ProductModel> get productModelCat => _productModelCat;
  List<ProductModel> _productModelSearch = [];
  List<ProductModel> get productModelSearch => _productModelSearch;

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

  Future<List<ProductModel>> getProductsByCategory(String categoryId) async {
    _isLoadingCat.value = true;
    _productModelCat = [];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Categories')
          .doc(categoryId)
          .collection('Products')
          .get();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        // _productModelCat = [];

        Object? data = documentSnapshot.data();
        ProductModel product =
            ProductModel.fromJson(data as Map<String, dynamic>);
        _productModelCat.add(product);
        if (kDebugMode) {
          print(">>>>>>>>>>>>>>>>>>>>>>>>>>>");
          print(_productModelCat.length);
          print(_productModelCat[0].name);
        }

        _isLoadingCat.value = false;
      }
      update();
    } catch (e) {
      _isLoadingCat.value = false;

      if (kDebugMode) {
        print('Error retrieving products: $e');
      }
    }

    return _productModelCat;
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

  // Function to search for items by product name in two collections
  Future<List<ProductModel>> searchProductByName(String productName) async {
    isLoadingSearch(true);

    _productModelSearch = [];

    try {
      print("<<<<<<<<<<<<<<<object>>>>>>>>>>>>>>>");

      List<QuerySnapshot> querySnapshots = await Future.wait([
        FirebaseFirestore.instance
            .collectionGroup('Products') // Search in the first collection
            .where('name', isEqualTo: productName)
            .get(),
        FirebaseFirestore.instance
            .collection('Categories') // Search in the second collection
            .doc('48o5FaCgrgBczFgJoqlK') // Add the document ID if needed
            .collection('Products') // Search in the subcollection
            .where('name', isEqualTo: productName)
            .get(),
      ]);
      print("1>>>>>>>>>>>>>>>>>>>>>>>>>>>");

      for (QuerySnapshot querySnapshot in querySnapshots) {
        print("2>>>>>>>>>>>>>>>>>>>>>>>>>>>");

        for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
          Object? data = documentSnapshot.data();
          ProductModel product =
              ProductModel.fromJson(data as Map<String, dynamic>);
          _productModelSearch.add(product);
          if (kDebugMode) {
            print(_productModelSearch.length);
            print(_productModelSearch[0].name);
          }
        }
      }
      isLoadingSearch(false);

      update();
    } catch (e) {
      isLoadingSearch(false);

      if (kDebugMode) {
        print('Error searching products by name: $e');
      }
    }

    return _productModelSearch;
  }
}
