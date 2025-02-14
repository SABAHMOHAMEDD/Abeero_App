import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/fav_listview.dart';
import '../../view_model/fav_view_model.dart';
import '../EmptyView/empty_fav_view.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavViewModel>(
      builder: (controller) => ConditionalBuilder(
        condition: controller.favouriteModel.isNotEmpty,
        builder: (BuildContext context) {
          return GetBuilder<FavViewModel>(
              init: Get.put(FavViewModel()),
              builder: (controller) => controller.favouriteModel.isNotEmpty
                  ? const Scaffold(
                      body: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          FavListview(),
                        ],
                      ),
                    )
                  : const EmptyFavView());
        },
        fallback: (BuildContext context) {
          return const EmptyFavView();
        },
      ),
    );
  }
}
