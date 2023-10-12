import 'package:abeero/view/Auth/SignIn_view.dart';
import 'package:abeero/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'layout_view.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? SignInView()
          : LayoutScreen();
    });
  }
}
