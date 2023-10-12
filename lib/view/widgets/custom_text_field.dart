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
            focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                )),
            enabledBorder:  OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                borderSide: BorderSide(color: Colors.grey.shade400)),
            border:  OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                borderSide: BorderSide(color: Colors.grey.shade400))

            ),
      ),
    );
  }
}
