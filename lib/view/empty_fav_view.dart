import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyFavView extends StatelessWidget {
  const EmptyFavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/images/emptyfavlistimage.json',
            width: 300,
            height: 300,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            'Favorites is Empty',
            style: TextStyle(
                fontSize: 28,
                color: Colors.black.withOpacity(0.7),
                fontFamily: 'SFProDisplay'),
          ),
        ],
      )),
    );
  }
}
