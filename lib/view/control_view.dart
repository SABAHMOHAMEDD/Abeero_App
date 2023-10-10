import 'package:abeero/view/SignIn_view.dart';
import 'package:abeero/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/userlayout/layout_screen.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null)
          ? LayoutScreen()
          : SignInView();
    });
  }
}
