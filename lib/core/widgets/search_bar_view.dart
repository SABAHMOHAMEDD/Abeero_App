import 'package:abeero/core/widgets/search_listview_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';
import '../../view_model/home_view_model.dart';

class SearchBarView extends StatelessWidget {
  SearchBarView({super.key});

  TextEditingController searchQuery = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) => Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 54,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
                BoxShadow(
                    offset: const Offset(5, 5),
                    blurRadius: 2,
                    color: KPrimaryColor.withOpacity(0.23)),
              ]),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller.searchQuery,
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: KTextColorBlack),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const SearchListviewView());

                  controller.searchProductByName();
                },
                child: Image(
                  image: const AssetImage(
                    "assets/images/search.png",
                  ),
                  color: KSecondryColor,
                  height: 40,
                  width: 40,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
