import 'package:abeero/core/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_form_field.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            const Row(
              children: [
                Icon(
                  Icons.radio_button_checked_sharp,
                  color: KPrimaryColor,
                  size: 22,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('Billing address is the same as delivery address'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField1(
              text: 'Street 1',
              hint: '21, Alex Davidson Avenue',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField1(
              text: 'Street 2',
              hint: 'Opposite Omegatron, Vicent Quarters',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField1(
              text: 'City',
              hint: 'Victoria Island',
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
