import 'package:abeero/view/widgets/category_listview_view.dart';
import 'package:abeero/view/widgets/new_release_ListView_view.dart';
import 'package:abeero/view/widgets/search_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';
import '../../view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  List<String> catTitle = ['Men', 'Women', 'Hats', 'Bags', 'Scarfs', 'Tops'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeViewModel>(
        init: Get.put(HomeViewModel()),
        builder: (controller) => Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(left: 15),
              //       child: Text(
              //         'Choose \n  Your Art..',
              //         style: TextStyle(
              //             fontSize: 28,
              //             fontWeight: FontWeight.w800,
              //             color: KPrimaryColor),
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 20,
              ),
              const SearchBarView(),
              const SizedBox(
                height: 40,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Category',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: KPrimaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CategoryListviewView(
                catTitle: catTitle,
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'New Release',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: KPrimaryColor),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      'See all',
                      style: TextStyle(color: TextColorBlack),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              NewReleaseListviewView(
                catTitle: catTitle,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
