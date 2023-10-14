import 'package:abeero/core/IconBroken.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants.dart';
import '../view_model/control_home_view_model.dart';

class LayoutScreen extends StatelessWidget {
  static const String RouteName = 'LayoutScreen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ControlHomeViewModel>(
          init: ControlHomeViewModel(),
          builder: (controller) => Scaffold(
                extendBody: true, //<------like this

                appBar: AppBar(
                  centerTitle: true,
                  scrolledUnderElevation: 0,
                  automaticallyImplyLeading: false,
                  title: const Text(
                    'Abeero',
                    style: TextStyle(
                        color: KPrimaryColor, fontWeight: FontWeight.w600),
                  ),
                ),
                body: controller.bottomScreens[controller.currentIndex],
                bottomNavigationBar: Container(
                  height: 68,
                  margin: const EdgeInsets.only(
                      bottom: 10, left: 20, right: 20, top: 10),
                  decoration: BoxDecoration(
                    color: Colors
                        .transparent, // Set background color to transparent

                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 8),
                          blurRadius: 4,
                          color: KPrimaryColor.withOpacity(0.23))
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: BottomNavigationBar(
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
                      currentIndex: controller.currentIndex,
                      onTap: (index) {
                        controller.changeSelectedIndex(index);
                      },
                      items: const [
                        BottomNavigationBarItem(
                            activeIcon: Padding(
                              padding: EdgeInsets.only(top: 12),
                              child: Text(
                                'Home',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            backgroundColor: KPrimaryColor,
                            icon: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Icon(IconBroken.Home),
                            ),
                            label: ''),
                        BottomNavigationBarItem(
                            activeIcon: Padding(
                              padding: EdgeInsets.only(top: 12),
                              child: Text(
                                'Cart',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            icon: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Icon(
                                IconBroken.Bag,
                              ),
                            ),
                            label: ''),
                        BottomNavigationBarItem(
                            activeIcon: Padding(
                              padding: EdgeInsets.only(top: 12),
                              child: Text(
                                'Favorites',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            backgroundColor: Colors.white,
                            icon: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Icon(IconBroken.Heart),
                            ),
                            label: ''),
                        BottomNavigationBarItem(
                            activeIcon: Padding(
                              padding: EdgeInsets.only(top: 12),
                              child: Text(
                                'Profile',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            backgroundColor: Colors.white,
                            icon: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Icon(IconBroken.Profile),
                            ),
                            label: ''),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }

  List<IconData> iconlist = [
    Icons.home,
    Icons.shopping_cart,
    Icons.favorite,
    Icons.person
  ];
}
