import 'package:abeero/core/constants.dart';
import 'package:abeero/view_model/checkout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/custom_text_form_field.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      init: CheckoutViewModel(),
      builder: (controller) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 35,
                ),
                CustomTextFormField1(
                  text: 'Street 1',
                  hint: '21, Alex Davidson Avenue',
                  onSave: (value) {
                    controller.street1 = value;
                  },
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return;
                    } else {
                      'you should enter your street 1';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField1(
                  text: 'Street 2',
                  hint: 'Opposite Omegatron, Vicent Quarters',
                  onSave: (value) {
                    controller.street2 = value;
                  },
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return;
                    } else {
                      'you should enter your street 2';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField1(
                  text: 'City',
                  hint: 'Victoria Island',
                  onSave: (value) {
                    controller.city = value;
                  },
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return;
                    } else {
                      'you should enter your City';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: CustomTextFormField1(
                        text: 'State',
                        hint: 'Lagos State',
                        onSave: (value) {
                          controller.state = value;
                        },
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return;
                          } else {
                            'you should enter your State';
                          }
                        },
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: CustomTextFormField1(
                        text: 'Country',
                        hint: 'Nigeria',
                        onSave: (value) {
                          controller.country = value;
                        },
                      ),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                const FittedBox(
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        Icon(
                          Icons.radio_button_checked_sharp,
                          color: KPrimaryColor,
                          size: 22,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Billing address is the same as delivery address ',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
