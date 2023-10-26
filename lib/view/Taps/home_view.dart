import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';
import '../../core/widgets/category_listview_view.dart';
import '../../core/widgets/new_release_ListView_view.dart';
import '../../core/widgets/search_bar_view.dart';
import '../../view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<String> catTitle = [
    'Men',
    'Women',
    'Hats',
    'Bags',
    'Scarfs',
    'Tops'
  ];

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
                height: 5,
              ),

              const SizedBox(
                height: 10,
              ),
              const SearchBarView(),
              const SizedBox(
                height: 25,
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
                      style: TextStyle(color: KTextColorBlack),
                    ),
                  )
                ],
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
