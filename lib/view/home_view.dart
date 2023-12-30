import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants.dart';
import '../core/widgets/category_listview_view.dart';
import '../core/widgets/new_release_ListView_view.dart';
import '../core/widgets/search_bar_view.dart';
import '../core/widgets/search_listview_view.dart';
import '../core/widgets/see_all_listview.dart';
import '../view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                    GestureDetector(
                        onTap: () {
                          Get.to(() => const SearchListviewView());
                        },
                        child: SearchBarView()),
                    const SizedBox(
                      height: 25,
                    ),
                    Column(
                      children: [
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
                        const CategoryListviewView(),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                'New Release',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: KPrimaryColor),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => const SeeAllView());
                                },
                                child: const Text(
                                  'See all',
                                  style: TextStyle(color: KTextColorBlack),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const NewReleaseListviewView(),
                      ],
                    )
                  ],
                ),
              ))),
    );
  }
}
