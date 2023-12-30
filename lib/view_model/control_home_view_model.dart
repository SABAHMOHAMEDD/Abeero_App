import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../view/Taps/cart_view.dart';
import '../view/Taps/favourites_view.dart';
import '../view/home_view.dart';
import '../view/Taps/profile_view.dart';

class ControlHomeViewModel extends GetxController {
  int _currentIndex = 0;

  get currentIndex => _currentIndex;
  List<Widget> bottomScreens = [
    const HomeScreen(),
    const CartView(),
    const FavouritesScreen(),
    const ProfileView()
  ];

  void changeSelectedIndex(int selectedIndex) {
    _currentIndex = selectedIndex;
    if (selectedIndex == 1) {}
    HapticFeedback.lightImpact();

    update();
  }
}
