import 'package:abeero/core/binding.dart';
import 'package:abeero/core/constants.dart';
import 'package:abeero/view/on_boarding_view.dart';
import 'package:abeero/view/signUp_view.dart';
import 'package:abeero/view/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'core/bloc_observer.dart';
import 'features/userlayout/cubit/cubit.dart';
import 'firebase_options.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
      ],
      child: GetMaterialApp(
        initialBinding: Binding(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'jannah',
          colorScheme: ColorScheme.fromSeed(seedColor: KPrimaryColor),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
