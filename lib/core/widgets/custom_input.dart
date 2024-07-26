import 'package:flutter/material.dart';
import 'package:password_manager/core/colors/palette.dart';
import 'package:sizer/sizer.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.label,
    this.controller,
  });
  final String label;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
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
        labelStyle: const TextStyle(color: Palette.gray),
      ),
    );
  }
}
