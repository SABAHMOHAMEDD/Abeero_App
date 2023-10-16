import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';
import '../../view_model/cart_view_model.dart';
import '../empty_cart_view.dart';
import '../widgets/cart_item_view.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: ConditionalBuilder(
        condition: true,
        builder: (BuildContext context) {
          return Scaffold(
            body: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                const CartListViewView(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 80,
                          height: 55,
                          child: GetBuilder<CartViewModel>(
                            init: CartViewModel(),
                            builder: (controller) => Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Total Price',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      '\$',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: KPrimaryColor),
                                    ),
                                    Text(
                                      controller.totalPrice.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black.withOpacity(0.8)),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                          )),
                      Container(
                        height: 55,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: KPrimaryColor.withOpacity(0.74)),
                        child: MaterialButton(
                          onPressed: () {},
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
            ),
          );
        },
        fallback: (BuildContext context) {
          return EmptyCartView();
        },
      ),
    );
  }
}
