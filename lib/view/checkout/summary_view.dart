import 'package:abeero/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/summary_listview.dart';
import '../../view_model/checkout_view_model.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            const SummaryListview(),
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Shipping Address',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        GetBuilder<CheckoutViewModel>(
                          builder: (controller) => Text(
                            '${controller.street1},${controller.street2}\n,${controller.city},${controller.state},${controller.country}',
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey.shade700),
                          ),
                        ),
                        Spacer(),
                        const Icon(
                          Icons.radio_button_checked_sharp,
                          color: KPrimaryColor,
                          size: 22,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Change',
                      style: TextStyle(
                          fontSize: 15,
                          color: KSecondryColor,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
