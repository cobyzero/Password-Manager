import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/widgets/custom_button.dart';
import 'package:password_manager/core/widgets/custom_input.dart';
import 'package:password_manager/core/widgets/texts.dart';
import 'package:sizer/sizer.dart';

class EditProfileSheet extends StatelessWidget {
  const EditProfileSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Texts.regular(
              "Edit profile",
              fontSize: 15,
            ).marginOnly(bottom: 4.h),
            const CustomInput(
              label: "First Name",
            ).marginOnly(bottom: 2.h),
            const CustomInput(
              label: "Last Name",
            ).marginOnly(bottom: 4.h),
            CustomButton(
              text: "Save Changes",
              onPressed: () {},
            ).marginOnly(bottom: 4.h),
          ],
        ),
      ),
    );
  }
}
