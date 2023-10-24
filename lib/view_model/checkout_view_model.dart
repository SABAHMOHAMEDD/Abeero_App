import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../view/checkout/address_view.dart';
import '../view/checkout/delivery_view.dart';
import '../view/checkout/summary_view.dart';

class CheckoutViewModel extends GetxController {
  double progress = 0.2;
  var activeStep = 0.obs;
  var selectedPagexNumber = 0.obs;
  bool get isLastPage => selectedPagexNumber.value == pages.length - 1;
  bool get isFirstPage => selectedPagexNumber.value == 0;

  String? street1, street2, city, state, country;
  final formKey = GlobalKey<FormState>();

  // change both index
  void changeStepperAndPageviewIndex(int index) {
    if (index == 0) {
      selectedPagexNumber.value = 0;
      activeStep.value = index;
    } else if (index == 1) {
      selectedPagexNumber.value = 1;
      activeStep.value = index;
    } else if (index == 2) {
      if (formKey.currentState!.validate()) {
        selectedPagexNumber.value = 2;
        activeStep.value = index;
      }
    }
    // change stepper index

    print('stepper index :<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>');

    print(activeStep);
  }

  // for next button
  forwardAct() {
    if (selectedPagexNumber == 0) {
      selectedPagexNumber.value += 1;
      changeStepperAndPageviewIndex(selectedPagexNumber.value);
    } else if (selectedPagexNumber == 1) {
      if (formKey.currentState!.validate()) {
        selectedPagexNumber.value += 1;
        changeStepperAndPageviewIndex(selectedPagexNumber.value);
      } else if (selectedPagexNumber == 2) {
        selectedPagexNumber.value += 1;
        changeStepperAndPageviewIndex(selectedPagexNumber.value);
      }
    }
  }

  // for back button
  backAct() {
    if (selectedPagexNumber == 1 || selectedPagexNumber == 2) {
      selectedPagexNumber.value -= 1;
      changeStepperAndPageviewIndex(selectedPagexNumber.value);
    }
  }

  List<Widget> pages = [
    DeliveryView(),
    const AddressView(),
    const SummaryView(),
  ];
}
