import 'package:abeero/core/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField1 extends StatelessWidget {
  final String text;

  final String? hint;

  void Function(String?)? onSave;
  String? Function(String?)? validator;

  CustomTextFormField1({
    required this.text,
    this.hint,
    this.onSave,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
        ),
        TextFormField(
          cursorColor: KPrimaryColor,
          onSaved: onSave,
          validator: validator,
          decoration: InputDecoration(

            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: KScaffoldColor, width: 1)),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: KPrimaryColor, width: 1)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: KPrimaryColor, width: 1)),
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.black,
            ),
            fillColor: Colors.white,
          ),
        )
      ],
    );
  }
}
