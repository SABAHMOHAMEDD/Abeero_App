import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

import '../../../core/cache_helper.dart';
import '../../../core/constants.dart';
import '../Auth/SignIn_view.dart';
import '../control_view.dart';

class OnBoardScreen extends StatefulWidget {
  static const String RouteName = 'onBoarding';

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  var boardingController = PageController();

  bool isLast = false;

  List images = [
    'assets/images/img.png',
    'assets/images/img_1.png',
    'assets/images/img_2.png'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 6,
              child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: boardingController,
                  itemCount: images.length,
                  onPageChanged: (int index) {
                    if (index == images.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                    ;
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      child: Image(
                        image: AssetImage(images[index]),
                        fit: BoxFit.contain,
                      ),
                    );
                  }),
            ),
            Expanded(
              child: SmoothPageIndicator(
                  controller: boardingController,
                  effect: const ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 9,
                      dotWidth: 9,
                      spacing: 5,
                      expansionFactor: 4,
                      activeDotColor: KPrimaryColor),
                  count: images.length),
            ),
            const Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 45),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Find the Best Corochet Pieces Of Art for u",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: KPrimaryColor),
                    ),
                    Text("there are many new pieces that will make you cool",
                        style: TextStyle(fontSize: 18, color: Colors.black38)),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: KPrimaryColor),
                    child: MaterialButton(
                      onPressed: () {
                        Get.offAll(const ControlView());
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Get Started",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 1, child: SizedBox())
          ],
        ),
      ),
    );
  }

  void onSubmit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value == true) {
        Get.offAll(SignInView());
      }
    });
  }
}
