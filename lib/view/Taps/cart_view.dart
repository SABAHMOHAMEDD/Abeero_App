import 'package:abeero/view/checkout/checkout_view.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';
import '../../core/widgets/cart_listview.dart';
import '../../view_model/cart_view_model.dart';
import '../EmptyView/empty_cart_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      builder: (controller) => ConditionalBuilder(
        condition: controller.cartProductModel.isNotEmpty,
        builder: (BuildContext context) {
          return GetBuilder<CartViewModel>(
              init: Get.put(CartViewModel()),
              builder: (controller) => controller.cartProductModel.isNotEmpty
                  ? Scaffold(
                      body: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const CartListview(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: 80,
                                  height: 55,
                                  child: GetBuilder<CartViewModel>(
                                    init: Get.find(),
                                    builder: (controller) => Center(
                                        child: FittedBox(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Total Price',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                '\$',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: KPrimaryColor),
                                              ),
                                              Text(
                                                controller.totalPrice
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black
                                                        .withOpacity(0.8)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                  )),
                              Container(
                                height: 55,
                                width: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: KPrimaryColor.withOpacity(0.74)),
                                child: MaterialButton(
                                  onPressed: () {
                                    Get.to(const CheckoutView(),
                                        transition: Transition.fadeIn);
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Checkout',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))
                  : const CircularProgressIndicator());
        },
        fallback: (BuildContext context) {
          return const EmptyCartView();
        },
      ),
    );
  }
}
