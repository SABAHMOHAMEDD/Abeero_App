import 'package:abeero/core/binding.dart';
import 'package:abeero/core/constants.dart';
import 'package:abeero/view/layout/control_view.dart';
import 'package:abeero/view_model/auth_view_model.dart';
import 'package:abeero/view_model/cart_view_model.dart';
import 'package:abeero/view_model/fav_view_model.dart';
import 'package:abeero/view_model/profile_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'core/local_storage_data.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(CartViewModel());
  Get.put(FavViewModel());

  Get.put(ProfileViewModel());
  Get.put(LocalStorageData());
  Get.put(AuthViewModel());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, widget!),
              maxWidth: 1200,
              minWidth: 480,
              defaultScale: true,
              breakpoints: const [
                ResponsiveBreakpoint.autoScale(480, name: 'SM'),
                ResponsiveBreakpoint.autoScale(800, name: 'MD'),
                ResponsiveBreakpoint.autoScale(1000, name: 'LG'),
                ResponsiveBreakpoint.autoScale(1200, name: 'XL'),
                ResponsiveBreakpoint.autoScale(2460, name: '2XL'),
              ],
            ),
        initialBinding: Binding(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
          fontFamily: 'jannah',
          colorScheme: ColorScheme.fromSeed(seedColor: KPrimaryColor),
          useMaterial3: true,
        ),
        home: const ControlView());
  }
}
