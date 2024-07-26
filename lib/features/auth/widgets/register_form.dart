import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/widgets/custom_input.dart';
import 'package:password_manager/core/widgets/texts.dart';
import 'package:sizer/sizer.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Texts.regular(
          "Personal details",
          fontSize: 20,
        ).marginOnly(bottom: 2.h),
        CustomInput(
          label: "Fist name",
        ),
      ],
    );
  }
}
