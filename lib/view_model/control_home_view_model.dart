import 'package:get/get.dart';

import '../view/Taps/cart_screen.dart';
import '../view/Taps/favourites_screen.dart';
import '../view/Taps/home_view.dart';
import '../view/Taps/profile_view.dart';
import 'package:flutter/material.dart';

class ControlHomeViewModel extends GetxController {
  int _currentIndex = 0;
  get currentIndex => _currentIndex;
  List<Widget> bottomScreens = [
    HomeScreen(),
    CartScreen(),
    FavouritesScreen(),
    ProfileView()
  ];

  void changeSelectedIndex(int selectedIndex) {
    _currentIndex = selectedIndex;
    update();
  }
}
