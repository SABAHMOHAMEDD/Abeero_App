import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../view_model/fav_view_model.dart';
import '../IconBroken.dart';
import '../constants.dart';

class FavoriteIconWidget extends StatelessWidget {
  final String productId;
  const FavoriteIconWidget({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavViewModel>(
      init: Get.put(FavViewModel()),
      builder: (controller) => FutureBuilder<bool>(
        future: controller.isProductInFavorites(productId!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(); // Show a loading indicator while checking the favorite status
          } else if (snapshot.hasError) {
            return const Text(
                'Error'); // Show an error message if there is an error
          } else {
            final isFavorite = snapshot.data ?? false;
            return isFavorite
                ? IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      controller.deleteProductFromFav(productId);
                    },
                    icon: const Center(child: Icon(Icons.favorite)),
                    color: KPrimaryColor,
                  )
                : const Icon(
                    IconBroken.Heart,
                    color: KPrimaryColor,
                  );
          }
        },
      ),
    );
  }
}
