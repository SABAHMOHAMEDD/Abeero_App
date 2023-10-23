import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';
import '../../view_model/cart_view_model.dart';

class CartListview extends StatelessWidget {
  const CartListview({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
        init: Get.put(CartViewModel()),
        builder: (controller) => Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.cartProductModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 140,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140,
                            child: Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Image(
                                  width: 140,
                                  fit: BoxFit.cover,
                                  image: NetworkImage(controller
                                          .cartProductModel[index]
                                          .productImage ??
                                      "")),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.cartProductModel[index].name ??
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                                KScaffoldColor.withOpacity(0.6),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    print("lllllllllllll");
                                                    controller.increaseQuantity(
                                                        index);
                                                  },
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 20,
                                                  ),
                                                ),
                                                Text(
                                                  controller
                                                      .cartProductModel[index]
                                                      .quantity
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.decreaseQuantity(
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
