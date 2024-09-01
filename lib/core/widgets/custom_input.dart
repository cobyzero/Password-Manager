import 'package:flutter/material.dart';
import 'package:password_manager/core/colors/palette.dart';
import 'package:sizer/sizer.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    this.label,
    this.controller,
    this.keyboardType,
    this.onChanged,
    this.hintText,
  });
  final String? label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      cursorColor: Palette.black,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.sp,
          ),
          borderSide: BorderSide(
            color: Palette.gray,
            width: .5.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(
            color: Palette.gray,
            width: .5.w,
          ),
        ),
        labelText: label,
        labelStyle: const TextStyle(
          color: Palette.gray,
        ),
      ),
    );
  }
}
