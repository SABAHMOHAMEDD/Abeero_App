import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../view/checkout/address_view.dart';
import '../view/checkout/delivery_view.dart';
import '../view/checkout/summary_view.dart';

class CheckoutViewModel extends GetxController {
  double progress = 0.2;
  var activeStep = 0.obs;
  var pageController = PageController();
  var selectedPagexNumber = 0.obs;
  bool get isLastPage => selectedPagexNumber.value == pages.length - 1;
  bool get isFirstPage => selectedPagexNumber.value == 0;

  String? street1, street2, city, state, country;
  GlobalKey<FormState> formKey = GlobalKey();

  // change both index
  void changeStepperAndPageviewIndex(int index) {
    // change stepper index
    activeStep.value = index;
    print('stepper index :<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>');

    print(activeStep);

    // change pageView index
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  // for next button
  forwardAct() {
    if (isLastPage) {
      // Get.offNamedUntil(CartView as String, (route) => false);
    } else {
      pageController.nextPage(
          duration: 300.milliseconds, curve: Curves.easeInOut);
    }
  }

  // for back button
  backAct() {
    if (isLastPage) {
      // Get.offNamedUntil(CartView as String, (route) => false);
    } else {
      pageController.previousPage(
          duration: 300.milliseconds, curve: Curves.easeInOut);
    }
  }

  List<Widget> pages = [
    DeliveryView(),
    const AddressView(),
    const SummaryView(),
  ];
}
