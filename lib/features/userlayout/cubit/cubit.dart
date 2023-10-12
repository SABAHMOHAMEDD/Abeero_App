import 'package:abeero/features/userlayout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view/Taps/cart_screen.dart';
import '../../../view/Taps/favourites_screen.dart';
import '../../../view/Taps/home_view.dart';
import '../../../view/Taps/profile_view.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(IntialState()); // need intial state in the super

  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;


  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChageBottomNavState());
  }
}
