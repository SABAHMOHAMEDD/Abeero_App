// import 'package:abeero/core/constants.dart';
// import 'package:easy_stepper/easy_stepper.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class CheckoutView extends StatefulWidget {
//   const CheckoutView({super.key});
//
//   @override
//   State<CheckoutView> createState() => _CheckoutViewState();
// }
//
// class _CheckoutViewState extends State<CheckoutView> {
//   int activeStep = 0;
//   double progress = 0.2;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.only(top: 20, left: 15, right: 10),
//           child: Column(
//             children: [
//               EasyStepper(
//                 activeStepTextColor: KPrimaryColor,
//                 activeStepBorderColor: KPrimaryColor,
//                 activeStep: activeStep,
//                 stepShape: StepShape.circle,
//                 stepBorderRadius: 15,
//                 stepRadius: 28,
//                 finishedStepBorderColor: KPrimaryColor,
//                 finishedStepTextColor: KPrimaryColor,
//                 finishedStepBackgroundColor: KPrimaryColor,
//                 activeStepIconColor: KPrimaryColor,
//                 unreachedStepBorderType: BorderType.normal,
//                 showLoadingAnimation: false,
//                 disableScroll: true,
//                 lineStyle: LineStyle(
//                     lineLength: 100,
//                     lineThickness: 6,
//                     lineSpace: 4,
//                     lineType: LineType.normal,
//                     defaultLineColor: KScaffoldColor,
//                     progress: progress,
//                     progressColor: KPrimaryColor,
//                     finishedLineColor: KPrimaryColor),
//                 borderThickness: 4,
//                 internalPadding: 15,
//                 steps: const [
//                   EasyStep(
//                     icon: Icon(Icons.delivery_dining_outlined),
//                     title: 'Delivery',
//                     //lineText: 'Add Address Info',
//                   ),
//                   EasyStep(
//                     icon: Icon(CupertinoIcons.info),
//                     title: 'Address',
//                     //  lineText: 'Go To summary',
//                   ),
//                   EasyStep(
//                     icon: Icon(Icons.check_circle_outline),
//                     title: 'Finish',
//                   ),
//                 ],
//                 onStepReached: (index) => setState(() => activeStep = index),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:abeero/core/constants.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/widgets/custom_button.dart';
import '../../view_model/checkout_view_model.dart';

class CheckoutView extends StatelessWidget {
  CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Checkout',
            style: TextStyle(color: KPrimaryColor, fontWeight: FontWeight.w600),
          ),
        ),
        body: Obx(() {
          final CheckoutViewModel controller =
              Get.put(CheckoutViewModel(), permanent: false);
          return Padding(
            padding: const EdgeInsets.only(top: 30, left: 15, right: 10),
            child: Column(
              children: [
                GetBuilder<CheckoutViewModel>(
                  init: CheckoutViewModel(),
                  builder: (controller) => EasyStepper(
                    activeStepTextColor: KPrimaryColor,
                    activeStepBorderColor: KPrimaryColor,
                    activeStep: controller.activeStep.value,
                    stepShape: StepShape.circle,
                    stepBorderRadius: 15,
                    stepRadius: 28,
                    finishedStepBorderColor: KPrimaryColor,
                    finishedStepTextColor: KPrimaryColor,
                    finishedStepBackgroundColor: KPrimaryColor,
                    activeStepIconColor: KPrimaryColor,
                    unreachedStepBorderType: BorderType.normal,
                    showLoadingAnimation: false,
                    disableScroll: true,
                    lineStyle: LineStyle(
                      lineLength: 100,
                      lineThickness: 6,
                      lineSpace: 4,
                      lineType: LineType.normal,
                      defaultLineColor: KScaffoldColor,
                      progress: controller.progress,
                      progressColor: KPrimaryColor,
                      finishedLineColor: KPrimaryColor,
                    ),
                    borderThickness: 4,
                    internalPadding: 15,
                    steps: const [
                      EasyStep(
                        icon: Icon(Icons.delivery_dining_outlined),
                        title: 'Delivery',
                        //lineText: 'Add Address Info',
                      ),
                      EasyStep(
                        icon: Icon(CupertinoIcons.info),
                        title: 'Address',
                        //  lineText: 'Go To summary',
                      ),
                      EasyStep(
                        icon: Icon(Icons.check_circle_outline),
                        title: 'Finish',
                      ),
                    ],
                    onStepReached: (index) =>
                        controller.changeStepperAndPageviewIndex(index),
                  ),
                ),
                Expanded(
                    child: Container(
                  child: controller.pages[controller.selectedPagexNumber.value],
                )),
                // Expanded(
                //   child: PageView(
                //     controller: controller.pageController,
                //     onPageChanged: controller.changeStepperAndPageviewIndex,
                //     children: controller.pages,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(children: [
                    controller.selectedPagexNumber.value == 0
                        ? const Expanded(child: SizedBox())
                        : Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: CustomButton(
                                onPressed: controller.backAct,
                                buttonText: 'Back',
                                backgroundColor: Colors.white,
                                textColor: KSecondryColor,
                              ),
                            ),
                          ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: CustomButton(
                          onPressed: controller.forwardAct,
                          buttonText: 'Next',
                          backgroundColor: KPrimaryColor.withOpacity(0.74),
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
