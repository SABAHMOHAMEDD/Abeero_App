import 'package:abeero/core/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField1 extends StatelessWidget {
  final String text;

  final String? hint;

  final void Function(String?)? onSave;
  final String? Function(String?)? validator;

  const CustomTextFormField1({
    super.key,
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
          style: const TextStyle(
            fontSize: 14,
            color: KTextColorBlack,
          ),
        ),
        TextFormField(
          cursorColor: KPrimaryColor,
          onSaved: onSave,
          validator: validator,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: KScaffoldColor, width: 1),
                borderRadius: BorderRadius.circular(15)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    BorderSide(color: KPrimaryColor.withOpacity(.7), width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    BorderSide(color: KPrimaryColor.withOpacity(.7), width: 1)),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 15),
            fillColor: Colors.white,
          ),
        )
      ],
    );
  }
}
