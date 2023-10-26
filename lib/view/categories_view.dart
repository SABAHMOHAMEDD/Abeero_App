import 'package:flutter/material.dart';

import '../core/IconBroken.dart';
import '../core/constants.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: SizedBox(
            height: screenSize.height,
            child: GridView.builder(
              itemCount: 10,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.contain,
                            image: AssetImage(
                              "assets/images/img_2.png",
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Name",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.black.withOpacity(0.7),
                                  )),
                              const Text(
                                "Description",
                                style: TextStyle(
                                  color: KTextColorBlack,
                                  fontSize: 12,
                                ),
                                maxLines: 1,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    "\$ 550",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: KPrimaryColor,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 240),
            ),
          ),
        ),
      ),
    );
  }
}
