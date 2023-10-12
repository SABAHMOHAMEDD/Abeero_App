import 'package:abeero/view/details_view.dart';
import 'package:abeero/view/widgets/animated_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../core/constants.dart';
import '../../view_model/home_view_model.dart';

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
              child: SizedBox(
                height: screenSize.height / 2.4,
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
                        width: double.infinity,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Image.network(
                              controller.productModel[index].productImage ?? "",
                              height: 170,
                              width: double.infinity,
                              fit: BoxFit.cover,
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
                                      color: TextColorBlack,
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
                      mainAxisExtent: 270),
                ),
              ),
            ),
    );
  }
}
