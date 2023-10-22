import 'package:abeero/core/binding.dart';
import 'package:abeero/core/constants.dart';
import 'package:abeero/view/Splash/splash_view.dart';
import 'package:abeero/view/control_view.dart';
import 'package:abeero/view_model/cart_view_model.dart';
import 'package:abeero/view_model/profile_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/local_storage_data.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(CartViewModel());
  Get.put(LocalStorageData());
  //Get.put(ProfileViewModel());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        fontFamily: 'jannah',
        colorScheme: ColorScheme.fromSeed(seedColor: KPrimaryColor),
        useMaterial3: true,
      ),
      home: const ControlView(),
    );
  }
}
