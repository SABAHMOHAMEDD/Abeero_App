import 'package:abeero/model/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/IconBroken.dart';
import '../../core/constants.dart';
import '../../core/widgets/animated_loading.dart';
import '../../view_model/home_view_model.dart';
import 'details_view.dart';

class CategoryView extends StatelessWidget {
  final List<ProductModel> productModel;
  final String categoryName;
  const CategoryView({
    super.key,
    required this.productModel,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) => controller.isLoadingCat.value
            ? const Scaffold(body: AnimatedLoading())
            : Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Text(
                    categoryName,
                    style: const TextStyle(
                        color: KPrimaryColor, fontWeight: FontWeight.w600),
                  ),
                ),
                body: SizedBox(
                  height: screenSize.height,
                  child: GridView.builder(
                    itemCount: productModel.length,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (kDebugMode) {
                            print(">>>>>>>>>>>>>>>>>>>>>>>>>>>");
                          }
                          Get.to(DetailsView(
                              productModel: controller.productModelCat[index]));
                        },
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                height: 150,
                                imageUrl: controller
                                        .productModelCat[index].productImage ??
                                    "",
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                      color: KPrimaryColor,
                                      borderRadius: BorderRadius.circular(45)),
                                  child: Image(
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover,
                                      image: imageProvider),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(productModel[index].name ?? "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                          color: Colors.black.withOpacity(0.7),
                                        )),
                                    Text(
                                      productModel[index].description ?? "",
                                      style: const TextStyle(
                                        color: KTextColorBlack,
                                        fontSize: 12,
                                      ),
                                      maxLines: 1,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "\$ ${productModel[index].price}",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: KPrimaryColor,
                                          ),
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          IconBroken.Heart,
                                          color: KPrimaryColor,
                                        )
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
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            mainAxisExtent: 270),
                  ),
                ),
              ),
      ),
    );
  }
}
