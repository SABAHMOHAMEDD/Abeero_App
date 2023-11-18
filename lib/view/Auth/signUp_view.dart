import 'package:abeero/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../core/constants.dart';

import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_field.dart';

class SignUpView extends GetWidget<AuthViewModel> {
  final formKey = GlobalKey<FormState>();

  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Obx(
            () => ModalProgressHUD(
              progressIndicator: const CircularProgressIndicator(
                color: Colors.white,
              ),
              inAsyncCall: controller.isLoading.value,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenSize.height / 7,
                        ),
                        const Text(
                          " Abeero App",
                          style: TextStyle(
                              fontFamily: "Pacifico",
                              color: KPrimaryColor,
                              fontSize: 32),
                        ),
                        SizedBox(
                          height: screenSize.height / 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Create your Account',
                              style: TextStyle(
                                  color: Colors.black87.withOpacity(.7),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            CustomTextFormField(
                              hintText: "Name",
                              hintTextColor: Colors.black54,
                              onChanged: (data) {
                                controller.name = data;
                              },
                              validator: (data) {
                                if (data!.isEmpty) {
                                  return "please enter name";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              hintText: "Email",
                              hintTextColor: Colors.black54,
                              onChanged: (data) {
                                controller.email = data;
                              },
                              validator: (data) {
                                if (data!.isEmpty) {
                                  return "please enter email";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              obscureText: controller.isHidden.value,
                              validator: (data) {
                                if (data!.isEmpty) {
                                  return "please enter password";
                                }
                              },
                              onChanged: (data) {
                                controller.password = data;
                              },
                              hintText: "Password",
                              hintTextColor: Colors.black54,
                              suffixIcon: IconButton(
                                onPressed: controller.togglePasswordVisibility,
                                icon: Icon(
                                  controller.isHidden.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: KSecondryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height / 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CustomButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                controller.signUpWithEmailAndPassword();
                              } else {}
                            },
                            buttonText: 'Sign Up',
                            backgroundColor: KPrimaryColor.withOpacity(0.74),
                            textColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?",
                                style: TextStyle(color: Colors.grey)),
                            InkWell(
                              onTap: () {
                                Get.back();
                                // Navigator.pop(context, SignInView.routeName);
                              },
                              child: Text(
                                ' Sign In',
                                style: TextStyle(color: KSecondryColor),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
