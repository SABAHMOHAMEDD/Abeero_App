import 'package:abeero/view_model/auth_view_model.dart';
import 'package:get/get.dart';

import '../view_model/cart_view_model.dart';
import '../view_model/control_home_view_model.dart';
import '../view_model/home_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlHomeViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
  }
}
