import 'package:flutter/material.dart';

class CustomSocailButton extends StatelessWidget {
  const CustomSocailButton({super.key, required this.iconPath, this.onTap});
  final String iconPath;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Center(child: Image(image: AssetImage(iconPath))),
      ),
    );
  }
}
