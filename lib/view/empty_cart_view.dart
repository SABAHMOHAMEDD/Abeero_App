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
            'assets/images/animation_lnsqj6db.json',
            width: 300,
            height: 300,
            fit: BoxFit.fill,

          )
          // Image(
          //     height: 150,
          //     width: 150,
          //     color: KPrimaryColor.withOpacity(0.8),
          //     image:  AssetImage('assets/images/empty-cart.png',)),
          ,
          const SizedBox(
            height: 25,
          ),
          Text(
            'Cart is Empty',
            style:
                TextStyle(fontSize: 28, color: Colors.black.withOpacity(0.7),
                fontFamily: 'SFProDisplay'
                ),
          ),
        ],
      )),
    );
  }
}
