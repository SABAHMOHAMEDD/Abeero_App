import 'package:abeero/features/userlayout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/pages/cart_screen.dart';
import '../../favourites/pages/favourites_screen.dart';
import '../../home/pages/home_screen.dart';
import '../../../view/profile_view.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(IntialState()); // need intial state in the super

  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomScreens = [
    HomeScreen(),
    CartScreen(),
    FavouritesScreen(),
    ProfileView()
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChageBottomNavState());
  }
}
