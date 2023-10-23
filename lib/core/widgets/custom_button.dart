import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color textColor;
  const CustomButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: backgroundColor),
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style:  TextStyle(
                  fontWeight: FontWeight.w500, color: textColor, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
