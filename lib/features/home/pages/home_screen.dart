import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../core/constants.dart';
import '../../../core/navigation.dart';
import '../../category/pages/categories_screen.dart';

class HomeScreen extends StatelessWidget {
  List<Banners>? banners = [
    Banners(image: "assets/images/img.png"),
    Banners(image: "assets/images/banner2.jpg"),
    Banners(image: "assets/images/banner3.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Choose \n  Your Art..',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: KPrimaryColor),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(left: 15),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      navigateTo(context, CategoryScreen());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: KSecondryColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Category Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            )),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                itemCount: 10),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'New Release',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: KPrimaryColor),
                ),
              ),
            ],
          ),
        ),
        Expanded(flex: 7, child: NewReleaseGrid()),
      ],
    ));
  }
}

class Banners {
  String image;

  Banners({
    required this.image,
  });
}

class NewReleaseGrid extends StatelessWidget {
  const NewReleaseGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: MasonryGridView.builder(
        itemCount: 9,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        itemBuilder: (context, index) {
          return InkWell(
            focusColor: KPrimaryColor.withOpacity(0.4),
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {},
            child: const NewReleaseTile(),
          );
        },
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
      ),
    );
  }
}

class NewReleaseTile extends StatelessWidget {
  const NewReleaseTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              const Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Image(
                      width: double.infinity,
                      height: 170,
                      image: AssetImage('assets/images/img.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Product name',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.7),
                        )),
                    Text(
                      'type',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_border_rounded,
                                size: 20,
                                color: Colors.black.withOpacity(0.6),
                              ),
                              Text(
                                '4.5',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                borderRadius: BorderRadius.circular(15)),
                            child: Icon(
                              Icons.favorite_outline,
                              color: KSecondryColor,
                            ),
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
      ),
    );
  }
}
