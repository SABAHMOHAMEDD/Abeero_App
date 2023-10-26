import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/fav_view_model.dart';
import '../constants.dart';

class FavListview extends StatelessWidget {
  const FavListview({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavViewModel>(
        init: Get.put(FavViewModel()),
        builder: (controller) => Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.favouriteModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 140,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            width: 140,
                            fit: BoxFit.cover,
                            imageUrl:
                                controller.favouriteModel[index].productImage ??
                                    "",
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.favouriteModel[index].name ?? "",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: KTextColorBlack),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '\$${controller.favouriteModel[index].price}',
                                    style: const TextStyle(
                                        color: KPrimaryColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        height: 1.5),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                ]),
                          ),
                          const Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, bottom: 30),
                            child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white),
                                child: IconButton(
                                  onPressed: () {
                                    controller.deleteProductFromFav(controller
                                            .favouriteModel[index].productId ??
                                        "");
                                  },
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: KPrimaryColor,
                                    size: 26,
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 7,
                  );
                },
              ),
            ));
  }
}
