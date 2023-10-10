import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
 final String buttonText;
  final VoidCallback? onTap;
  final Color? textColor;
 final Color? backgroundcolor;

  CustomButton({required this.buttonText, this.onTap, this.textColor, this.backgroundcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: double.infinity,
      decoration: BoxDecoration(
          color: backgroundcolor, borderRadius: BorderRadius.circular(12)),
      child: MaterialButton(
        onPressed: onTap,
        child: Text(
          buttonText,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
