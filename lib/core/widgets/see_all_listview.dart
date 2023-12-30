import 'package:flutter/material.dart';
import 'package:abeero/view/Taps/details_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';
import '../../view_model/home_view_model.dart';
import 'animated_loading.dart';

class SeeAllView extends StatelessWidget {
  const SeeAllView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.isLoading.value
          ? const Scaffold(body: AnimatedLoading())
          : SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: const Text("New Release "),
                ),
                body: SizedBox(
                  height: screenSize.height,
                  child: GridView.builder(
                    itemCount: controller.productModel.length,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(DetailsView(
                              productModel: controller.productModel[index]));
                        },
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              //color: KScaffoldColor.withOpacity(.4),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              CachedNetworkImage(
                                height: 170,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                imageUrl: controller
                                        .productModel[index].productImage ??
                                    "",
                                errorWidget: (context, url, error) => Icon(
                                  Icons.error,
                                  color: KPrimaryColor.withOpacity(.5),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        controller.productModel[index].name ??
                                            "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                          color: Colors.black.withOpacity(0.7),
                                        )),
                                    Text(
                                      controller.productModel[index]
                                              .description ??
                                          "",
                                      style: const TextStyle(
                                        color: KTextColorBlack,
                                        fontSize: 12,
                                      ),
                                      maxLines: 1,
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "\$"
                                          "${controller.productModel[index].price ?? ""}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: KSecondryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            mainAxisExtent: 290),
                  ),
                ),
              ),
            ),
    );
  }
}
