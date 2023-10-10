import 'package:abeero/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../core/constants.dart';
import '../core/widgets/custom_button.dart';
import '../core/widgets/custom_text_field.dart';
import 'SignIn_view.dart';

class SignUpView extends GetWidget<AuthViewModel> {
  static const routeName = "RegisterScreen";

  final formKey = GlobalKey<FormState>();

  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: ModalProgressHUD(
            progressIndicator: const CircularProgressIndicator(
              color: Colors.white,
            ),
            inAsyncCall: controller.isLoading,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 36),
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
                                fontSize: 18,
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
                            onchanged: (data) {
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
                            onchanged: (data) {
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
                            obscureText: true,
                            validator: (data) {
                              if (data!.isEmpty) {
                                return "please enter password";
                              }
                            },
                            hintText: "Password",
                            hintTextColor: Colors.black54,
                            onchanged: (data) {
                              controller.password = data;
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenSize.height / 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CustomButton(
                          backgroundcolor: KPrimaryColor,
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              controller.signUpWithEmailAndPassword();
                            } else {}
                          },
                          buttonText: 'Sign Up',
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
                              Navigator.pop(context, SignInView.routeName);
                            },
                            child:  Text(
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
          )),
    );
  }
}
