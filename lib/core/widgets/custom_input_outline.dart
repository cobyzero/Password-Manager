import 'package:flutter/material.dart';
import 'package:password_manager/core/colors/palette.dart';

class CustomInputOutline extends StatelessWidget {
  const CustomInputOutline({
    super.key,
    required this.hintText,
    this.controller,
  });
  final String hintText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Palette.black,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Palette.black,
            width: 1.5,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Palette.gray,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
