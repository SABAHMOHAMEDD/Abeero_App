import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptySearchView extends StatelessWidget {
  const EmptySearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/images/emptysearch.json',
            width: double.infinity,
            height: 400,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            'Not founded',
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
