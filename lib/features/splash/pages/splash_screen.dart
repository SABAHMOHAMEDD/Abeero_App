import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../onboarding/on_board_screen.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "SplashScreen";

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 150,
      backgroundColor: KPrimaryColor.withOpacity(0.9),
      splash: const Column(
        children: [
          // Image(
          //   image: AssetImage("assets/images/appIcon.jpg"),
          //   height: 100,
          //   width: 100,
          // ),
          Text(
            "Abeero",
            style: TextStyle(

                //    fontFamily: "Schyler", color: Colors.white, fontSize: 24),
                fontFamily: "Pacifico",
                color: Colors.white,
                fontSize: 32),
          ),
        ],
      ),
      nextScreen: OnBoardScreen(),
      splashTransition: SplashTransition.sizeTransition,

      //pageTransitionType: PageTransitionType.downToUp,
    );
  }
}
