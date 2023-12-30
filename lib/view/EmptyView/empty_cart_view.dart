import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/images/emptycartlistimage.json',
            width: double.infinity,
            height: 400,
            fit: BoxFit.contain,
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
