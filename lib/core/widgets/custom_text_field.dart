import 'package:abeero/core/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final Color? hintTextColor;
  final Function(String)? onChanged;
  final String? validateMsg;
  final String? Function(String?)? validator;

  const CustomTextFormField(
      {super.key,
      this.hintText,
      this.hintTextColor,
      this.onChanged,
      this.validator,
      this.obscureText = false,
      this.validateMsg});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        style: const TextStyle(
            color: Colors.black54, decoration: TextDecoration.none),
        cursorColor: KPrimaryColor,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: hintTextColor),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                borderSide: BorderSide(color: Colors.grey.shade400)),
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                borderSide: BorderSide(color: Colors.grey.shade400))),
      ),
    );
  }
}
