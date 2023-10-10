import 'package:abeero/core/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String? hintText;
  bool obscureText = false;
  Color? hintTextColor;
  Function(String)? onchanged;
  String? validatemsg;
  String? Function(String?)? validator;

  CustomTextFormField(
      {super.key,
      this.hintText,
      this.hintTextColor,
      this.onchanged,
      this.validator,
      this.obscureText = false,
      this.validatemsg});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        obscureText: obscureText,
        validator: validator,
        onChanged: onchanged,
        style: const TextStyle(
            color: Colors.black54, decoration: TextDecoration.none),
        cursorColor: KPrimaryColor,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: hintTextColor),
            border: InputBorder.none
            // focusedBorder: const OutlineInputBorder(
            //     borderSide: BorderSide(color: Colors.grey),
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(8),
            //     )),
            // enabledBorder: const OutlineInputBorder(
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(8),
            //     ),
            //     borderSide: BorderSide(color: Colors.grey)),
            // border: const OutlineInputBorder(
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(8),
            //     ),
            //     borderSide: BorderSide(color: Colors.grey))

            ),
      ),
    );
  }
}
