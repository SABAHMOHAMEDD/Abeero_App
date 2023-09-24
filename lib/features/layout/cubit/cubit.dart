import 'package:abeero/features/layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/pages/cart_screen.dart';
import '../../favourites/pages/favourites_screen.dart';
import '../../home/pages/home_screen.dart';
import '../../profile/pages/profile_screen.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(IntialState()); // need intial state in the super

  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomScreens = [
    HomeScreen(),
    CartScreen(),
    FavouritesScreen(),
    profileScreen()
  ];

  void Changebottom(int index) {
    currentIndex = index;
    emit(ChageBottomNavState());
  }
}
