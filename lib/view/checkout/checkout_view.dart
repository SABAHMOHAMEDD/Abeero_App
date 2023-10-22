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
import 'package:abeero/view/checkout/summary_view.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'address_view.dart';
import 'delivery_view.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  _CheckoutViewState createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  int activeStep = 0;
  double progress = 0.2;
  PageController pageController = PageController(initialPage: 0);

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
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 15, right: 10),
          child: Column(
            children: [
              EasyStepper(
                activeStepTextColor: KPrimaryColor,
                activeStepBorderColor: KPrimaryColor,
                activeStep: activeStep,
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
                  progress: progress,
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
                onStepReached: (index) {
                  setState(() {
                    activeStep = index;
                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  });
                },
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      activeStep = index;
                    });
                  },
                  children: [
                    // Replace these pages with your own pages for each step
                    DeliveryView(),
                    const AddressView(),
                    const SummaryView()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
