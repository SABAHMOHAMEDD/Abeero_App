import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/Taps/details_view.dart';
import '../../view/EmptyView/empty_search_view.dart';
import '../../view_model/home_view_model.dart';
import '../IconBroken.dart';
import '../constants.dart';
import '../helper/function.dart';
import 'animated_loading.dart';

class SearchListviewView extends StatelessWidget {
  const SearchListviewView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) => controller.isLoadingSearch.value
            ? const Scaffold(body: AnimatedLoading())
            : controller.productModelSearch.isNotEmpty
                ? Scaffold(
                    body: SizedBox(
                      height: screenSize.height,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: GridView.builder(
                          itemCount: controller.productModelSearch.length,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => DetailsView(
                                    productModel:
                                        controller.productModelSearch[index]));
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
                                              .productModelSearch[index]
                                              .productImage ??
                                          "",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        decoration: BoxDecoration(
                                            color: KPrimaryColor,
                                            borderRadius:
                                                BorderRadius.circular(45)),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 17,
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                              ),
                                              children: highlightSearchQuery(
                                                controller
                                                        .productModelSearch[
                                                            index]
                                                        .name ??
                                                    '',
                                                controller.searchQuery.text,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            controller.productModelSearch[index]
                                                    .description ??
                                                "",
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
                                                "\$ ${controller.productModelSearch[index].price}",
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
                  )
                : const Scaffold(
                    body: EmptySearchView(),
                  ));
  }
}

