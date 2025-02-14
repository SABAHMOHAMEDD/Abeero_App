import 'package:abeero/view/EmptyView/empty_cart_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';
import '../../view_model/cart_view_model.dart';
import '../IconBroken.dart';

class CartListview extends StatelessWidget {
  const CartListview({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
        builder: (controller) => controller.cartProductModel.isNotEmpty
            ? Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.cartProductModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Slidable(
                      key: const ValueKey(0),
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: IconBroken.Delete,
                            label: 'Delete',
                            onPressed: (BuildContext context) {
                              controller.deleteProductFromCart(
                                  controller
                                          .cartProductModel[index].productId ??
                                      "",
                                  index);
                            },
                          ),
                        ],
                      ),
                      child: Container(
                        height: 140,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                width: 140,
                                fit: BoxFit.cover,
                                imageUrl: controller
                                        .cartProductModel[index].productImage ??
                                    "",
                                errorWidget: (context, url, error) => Icon(
                                  Icons.error,
                                  color: KPrimaryColor.withOpacity(.5),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller
                                                .cartProductModel[index].name ??
                                            "",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: KTextColorBlack),
                                      ),
                                      const SizedBox(
                                        height: 5,
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: 40,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color:
                                                    KScaffoldColor.withOpacity(
                                                        0.6),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        if (kDebugMode) {
                                                          print("lllllllllllll");
                                                        }
                                                        controller
                                                            .increaseQuantity(
                                                                index);
                                                      },
                                                      child: const Icon(
                                                        Icons.add,
                                                        size: 20,
                                                      ),
                                                    ),
                                                    Text(
                                                      controller
                                                          .cartProductModel[
                                                              index]
                                                          .quantity
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        controller
                                                            .decreaseQuantity(
                                                                index);
                                                      },
                                                      child: const Icon(
                                                        Icons.remove,
                                                        size: 20,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )),
                                        ],
                                      )
                                    ]),
                              ),
                            ],
                          ),
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
              )
            : const EmptyCartView());
  }
}
