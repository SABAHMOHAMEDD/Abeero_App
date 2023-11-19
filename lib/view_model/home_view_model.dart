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
  final ValueNotifier<bool> _isLoadingAllProducts = ValueNotifier(false);
  ValueNotifier<bool> get isLoadingAllProducts => _isLoadingAllProducts;
  // final ValueNotifier<bool> _isLoadingSearch = ValueNotifier(false);
  // ValueNotifier<bool> get isLoadingSearch => _isLoadingSearch;
  var isLoadingSearch = false.obs;

  final List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  final List<ProductModel> _productModel = [];
  List<ProductModel> get productModel => _productModel;

  List<ProductModel> _productModelCat = [];
  List<ProductModel> get productModelCat => _productModelCat;
  List<ProductModel> _allProducts = [];
  List<ProductModel> get allProducts => _allProducts;
  late List<ProductModel> _productModelSearch = [];
  List<ProductModel> get productModelSearch => _productModelSearch;

  HomeViewModel() {
    getCategoryGrid();
    getNewRelease();
    getAllProducts();
  }

  void searchProductByName(String productName) {
    _productModelSearch.clear(); // Clear the previous search results

    // Remove leading and trailing spaces from the search term
    String searchTerm = productName.trim();

    // Perform the search only if the search term contains at least one non-space character
    if (searchTerm.isNotEmpty) {
      // Search in _allProducts list
      for (ProductModel product in _allProducts) {
        String? lowercaseProductName = product.name?.toLowerCase();
        if (lowercaseProductName!.contains(searchTerm.toLowerCase())) {
          _productModelSearch.add(product);
        }
      }
    }
  }

  // void searchProductByName(String productName) {
  //   _productModelSearch.clear();
  //   _productModelSearch = []; // Clear the previous search results
  //
  //   // Convert the search term and product names to lowercase for case-insensitive comparison
  //   String searchTerm = productName.toLowerCase();
  //   // Search in _productModelCat list
  //
  //   for (ProductModel product in _allProducts) {
  //     String? lowercaseProductName = product.name?.toLowerCase();
  //     if (lowercaseProductName!.contains(searchTerm)) {
  //       _productModelSearch.add(product);
  //     }
  //   }
  // }

  getCategoryGrid() async {
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

  Future<void> getAllProducts() async {
    try {
      _isLoadingAllProducts.value = true;
      //get all products under all collections that called Products
      // which here are (new release products and the products in each category)
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collectionGroup('Products').get();

      List<ProductModel> products = [];

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Object? data = documentSnapshot.data();
        print(">>>>>>>>>>>>>>>>>>>>hhrhrhrh>>>>");

        ProductModel product =
            ProductModel.fromJson(data as Map<String, dynamic>);
        print(product.name);

        products.add(product);
      }
      update();

      _allProducts.assignAll(products);

      _isLoadingAllProducts.value = false;
    } catch (e) {
      _isLoadingAllProducts.value = false;

      if (kDebugMode) {
        print('Error retrieving products: $e');
      }
    }
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
}
