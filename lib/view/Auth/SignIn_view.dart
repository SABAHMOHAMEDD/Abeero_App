import 'package:abeero/view/widgets/custom_button.dart';
import 'package:abeero/view/widgets/custom_socail_button.dart';
import 'package:abeero/view/widgets/custom_text_field.dart';
import 'package:abeero/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../core/constants.dart';

import 'signUp_view.dart';

class SignInView extends GetWidget<AuthViewModel> {
  static const routeName = "LoginScreen";

  final formKey = GlobalKey<FormState>();

  final bool isLoading = false;

  SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: GetBuilder<AuthViewModel>(
        init: AuthViewModel(),
        builder: (controller) => Scaffold(
            backgroundColor: Colors.white,
            body: ModalProgressHUD(
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
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                            onchanged: (data) {
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
                          obscureText: true,
                          validator: (data) {
                            if (data!.isEmpty) {
                              return "please enter password";
                            }
                          },
                          onchanged: (data) {
                            controller.password = data;
                          },
                          hintText: "Password",
                          hintTextColor: Colors.black54,
                        ),
                        SizedBox(
                          height: screenSize.height / 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CustomButton(
                            backgroundcolor: KPrimaryColor,
                            buttonText: 'Sign In',
                            textColor: Colors.white,
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                controller.signInWithEmailAndPassword();
                              } else {}
                            },
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
                            const SizedBox(
                              width: 50,
                            ),
                            CustomSocailButton(
                              onTap: () {
                                controller.facebookSignInMethod();
                              },
                              iconPath: 'assets/images/facebook.png',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height / 10,
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
              ),
            )),
      ),
    );
  }
}
