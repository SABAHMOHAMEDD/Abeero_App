import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../core/constants.dart';

class EmptyCartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/images/emptycartlistimage.json',
            width: 300,
            height: 300,
            fit: BoxFit.fill,
          )

          ,
          const SizedBox(
            height: 25,
          ),
          Text(
            'Cart is Empty',
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
