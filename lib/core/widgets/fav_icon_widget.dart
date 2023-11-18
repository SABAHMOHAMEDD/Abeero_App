import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        future: controller.isProductInFavorites(productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          } else if (snapshot.hasError) {
            return const Text('Error');
          } else {
            final isFavorite = snapshot.data ?? false;
            return isFavorite
                ? IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      controller.deleteProductFromFav(productId);
                    },
                    icon: const Center(
                        child: Icon(
                      Icons.favorite,
                      size: 28,
                    )),
                    color: KPrimaryColor,
                  )
                : const Icon(
                    IconBroken.Heart,
                    color: KPrimaryColor,
                    size: 28,
                  );
          }
        },
      ),
    );
  }
}
