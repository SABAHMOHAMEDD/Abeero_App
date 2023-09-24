import 'package:abeero/core/constants.dart';
import 'package:abeero/features/layout/layout_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc_observer.dart';
import 'features/layout/cubit/cubit.dart';
import 'features/login/cubit/login_cubit.dart';
import 'features/register/cubit/register_cubit.dart';
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
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => LayoutCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'jannah',
          colorScheme: ColorScheme.fromSeed(seedColor: KPrimaryColor),
          useMaterial3: true,
        ),
        home: LayoutScreen(),
      ),
    );
  }
}
