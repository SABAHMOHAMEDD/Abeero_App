import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';
import '../../view/categories_view.dart';
import '../../view_model/home_view_model.dart';
import 'animated_loading.dart';

class CategoryListviewView extends StatelessWidget {
  const CategoryListviewView({super.key, required this.catTitle});
  final List<String> catTitle;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.isLoading.value
          ? const Center(child: AnimatedLoading())
          : SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListView.separated(
                  itemCount: controller.categoryModel.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(CategoryScreen());
                      },
                      child: Container(
                        height: 100,
                        width: 90,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade50,

                            //color: KScaffoldColor.withOpacity(.4),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: KScaffoldColor,
                              radius: 28,
                              backgroundImage: NetworkImage(controller
                                      .categoryModel[index].categoryImage ??
                                  "https://firebasestorage.googleapis.com/v0/b/abeero-cd57f.appspot.com/o/e608c6be18ca364c75444c61430f81a2.jpg?alt=media&token=fd746e64-4de6-4aed-9754-d150b176d973&_gl=1*ft41x2*_ga*MTExNDk2NTUwNi4xNjkxNjgwNDI2*_ga_CW55HF8NVT*MTY5NzEwMDI4MS44OC4xLjE2OTcxMDA3MjYuMzUuMC4w"),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              controller.categoryModel[index].name ?? "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: KTextColorBlack,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                ),
              ),
            ),
    );
  }
}
