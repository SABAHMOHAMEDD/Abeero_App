import 'package:abeero/view/details_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../core/constants.dart';
import '../../view_model/home_view_model.dart';
import 'animated_loading.dart';

class NewReleaseListviewView extends StatelessWidget {
  const NewReleaseListviewView({super.key, required this.catTitle});
  final List<String> catTitle;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.isLoading.value
          ? const Center(child: AnimatedLoading())
          : Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                height: screenSize.height / 2,
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
                              imageUrl:
                                  controller.productModel[index].productImage ??
                                      "",
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
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
                                      controller.productModel[index].name ?? "",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                        color: Colors.black.withOpacity(0.7),
                                      )),
                                  Text(
                                    controller
                                            .productModel[index].description ??
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      mainAxisExtent: 290),
                ),
              ),
            ),
    );
  }
}
