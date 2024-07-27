import 'package:flutter/material.dart';
import 'package:password_manager/core/colors/palette.dart';

class CustomInputOutline extends StatelessWidget {
  const CustomInputOutline({
    super.key,
    required this.hintText,
  });
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
