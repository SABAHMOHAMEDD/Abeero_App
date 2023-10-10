import 'package:abeero/core/IconBroken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LayoutScreen extends StatelessWidget {
  static const String RouteName = 'LayoutScreen';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return SafeArea(
          child: Scaffold(
            // appBar: AppBar(
            //   scrolledUnderElevation: 0,
            //   automaticallyImplyLeading: false,
            //   title: Text(
            //     'Abeero',
            //     style:
            //         TextStyle(color: KPrimaryColor, fontWeight: FontWeight.w600),
            //   ),
            // ),
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              mouseCursor: MouseCursor.uncontrolled,
              backgroundColor: KPrimaryColor,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              selectedItemColor: Colors.white.withOpacity(0.9),
              unselectedLabelStyle:
                  TextStyle(color: Colors.white.withOpacity(0.6)),
              unselectedItemColor: Colors.white.withOpacity(0.6),
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: const [
                BottomNavigationBarItem(
                    backgroundColor: KPrimaryColor,
                    icon: Icon(IconBroken.Home),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      IconBroken.Bag,
                    ),
                    label: 'Cart'),
                BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: Icon(IconBroken.Heart),
                    label: 'Favorites'),
                BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: Icon(IconBroken.Profile),
                    label: 'Profile'),
              ],
            ),
          ),
        );
      },
    );
  }

  List<IconData> iconlist = [
    Icons.home,
    Icons.shopping_cart,
    Icons.favorite,
    Icons.person
  ];
}

