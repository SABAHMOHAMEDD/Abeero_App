import 'package:abeero/core/widgets/animated_loading.dart';
import 'package:abeero/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../core/constants.dart';

import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_socail_button.dart';
import '../../core/widgets/custom_text_field.dart';
import 'signUp_view.dart';

class SignInView extends GetWidget<AuthViewModel> {
  final formKey = GlobalKey<FormState>();

  SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return GetBuilder<AuthViewModel>(
      init: AuthViewModel(),
      builder: (controller) => Obx(() => ModalProgressHUD(
            inAsyncCall: controller.isLoading.value,
            progressIndicator: const AnimatedLoading(),
            child: Scaffold(
                backgroundColor: Colors.white,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: screenSize.height / 7,
                          ),
                          const Center(
                            child: Text(
                              "Abeero App",
                              style: TextStyle(
                                  fontFamily: "Pacifico",
                                  color: KPrimaryColor,
                                  fontSize: 32),
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height / 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Login to your Account',
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
                          CustomTextFormField(
                              onChanged: (data) {
                                controller.email = data;
                              },
                              hintText: "Email",
                              hintTextColor: Colors.black54,
                              validator: (data) {
                                if (data!.isEmpty) {
                                  return "please enter email";
                                }
                              }),
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
                          SizedBox(
                            height: screenSize.height / 35,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CustomButton(
                              buttonText: 'Sign In',
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  controller.signInWithEmailAndPassword();
                                } else {}
                              },
                              backgroundColor: KPrimaryColor.withOpacity(0.74),
                              textColor: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("-Or Sign in with-",
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomSocailButton(
                                iconPath: 'assets/images/google.png',
                                onTap: () {
                                  print('kkkkkkk');

                                  controller.googleSignInMethod();
                                  print('kkkkkkk');
                                },
                              ),

                              // CustomSocailButton(
                              //   onTap: () {
                              //     controller.facebookSignInMethod();
                              //   },
                              //   iconPath: 'assets/images/facebook.png',
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: screenSize.height / 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account?",
                                  style: TextStyle(color: Colors.grey)),
                              InkWell(
                                onTap: () {
                                  Get.to(SignUpView());
                                },
                                //  Navigator.pop(context, LoginScreen.routeName);

                                child: Text(
                                  ' Sign Up',
                                  style: TextStyle(color: KSecondryColor),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: screenSize.height / 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          )),
    );
  }
}
