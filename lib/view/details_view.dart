import 'package:abeero/model/product_model.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import '../core/constants.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(
                  //   height: 30,
                  // ),
                  Image.network(
                    productModel.productImage ?? "",
                    height: 310,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
            Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50)),
                            color: KPrimaryColor.withOpacity(0.2),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 55,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productModel.name ?? "",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: Colors.black.withOpacity(0.8)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ExpandableText(
                                      productModel.description ?? ""
                                      // 'therefore there are no SliverStaggeredGrid '

                                      ,
                                      expandText: 'show more',
                                      collapseText: 'show less',
                                      linkColor: KPrimaryColor,
                                      maxLines: 3,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          letterSpacing: 0.5),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Container(
                                        width: 100,
                                        height: 60,
                                        child: Center(
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
                                                Text(
                                                  '\$',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: KSecondryColor),
                                                ),
                                                Text(
                                                  productModel.price ?? "",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: KSecondryColor),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24),
                                    child: Container(
                                      width: 200,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20)),
                                          color:
                                              KPrimaryColor.withOpacity(0.74)),
                                      child: MaterialButton(
                                        onPressed: () {},
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.shopping_cart_outlined,
                                                size: 19,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                'Add To Cart',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(bottom: 0, top: 8, right: 30),
                        child: Container(
                            height: 38,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: KPrimaryColor.withOpacity(0.74)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 30),
                                  child: Icon(
                                    Icons.minimize,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  '02',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                ),
                                const Icon(
                                  Icons.add,
                                  size: 19,
                                ),
                              ],
                            )),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(bottom: 0, top: 8, left: 30),
                        child: Container(
                            height: 38,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.grey.shade50),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: KPrimaryColor,
                                ),
                                Text('4.5'),
                              ],
                            )),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
