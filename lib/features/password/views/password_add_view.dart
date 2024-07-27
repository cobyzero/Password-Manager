import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/colors/palette.dart';
import 'package:password_manager/core/widgets/custom_button.dart';
import 'package:password_manager/core/widgets/custom_input.dart';
import 'package:password_manager/core/widgets/custom_input_outline.dart';
import 'package:password_manager/core/widgets/texts.dart';
import 'package:password_manager/features/password/controllers/password_controller.dart';
import 'package:sizer/sizer.dart';

class PasswordAddView extends GetView<PasswordController> {
  const PasswordAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      bottomNavigationBar: CustomButton(
        text: "Create password",
        onPressed: () {},
      ).marginSymmetric(vertical: 3.h, horizontal: 10.w),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButton(),
                const Texts.regular(
                  "New password",
                  fontSize: 17,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.lock,
                    size: 20.sp,
                  ),
                ),
              ],
            ).marginOnly(bottom: 3.h),
            Row(
              children: [
                const Texts.regular(
                  "Name",
                  fontSize: 12,
                ).marginOnly(right: 10.w),
                const Expanded(
                  child: CustomInputOutline(
                    hintText: "website or app name",
                  ),
                ),
                Icon(
                  Icons.check_circle_outline,
                  color: Palette.green,
                  size: 18.sp,
                ).marginOnly(left: 8.w, top: 1.h),
              ],
            ).marginOnly(bottom: 2.h),
            Row(
              children: [
                const Texts.regular(
                  "User id",
                  fontSize: 12,
                ).marginOnly(right: 10.w),
                const Expanded(
                  child: CustomInputOutline(
                    hintText: "username or email id",
                  ),
                ),
                Icon(
                  Icons.check_circle_outline,
                  color: Palette.green,
                  size: 18.sp,
                ).marginOnly(left: 8.w, top: 1.h),
              ],
            ).marginOnly(bottom: 5.h),
            CustomInput(
              hintText: "Password",
            ),
          ],
        ).marginSymmetric(horizontal: 6.w),
      ),
    );
  }
}
