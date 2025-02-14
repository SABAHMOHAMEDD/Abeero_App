import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/cart_view_model.dart';
import '../constants.dart';

class SummaryListview extends StatelessWidget {
  const SummaryListview({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: Get.put(CartViewModel()),
      builder: (controller) => Expanded(
        flex: 1,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.cartProductModel.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: CachedNetworkImage(
                      width: 150,
                      fit: BoxFit.cover,
                      imageUrl:
                          controller.cartProductModel[index].productImage ??
                              "",
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Text(
                    controller.cartProductModel[index].name ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: KTextColorBlack),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '\$${controller.cartProductModel[index].price}',
                    style: const TextStyle(
                        color: KPrimaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        height: 1.5),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 6,
            );
          },
        ),
      ),
    );
  }
}
