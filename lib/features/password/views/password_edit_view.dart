import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/colors/palette.dart';
import 'package:password_manager/core/const/const.dart';
import 'package:password_manager/core/widgets/custom_button.dart';
import 'package:password_manager/core/widgets/custom_dropdown_button.dart';
import 'package:password_manager/core/widgets/custom_input_outline.dart';
import 'package:password_manager/core/widgets/texts.dart';
import 'package:password_manager/features/password/controllers/password_controller.dart';
import 'package:sizer/sizer.dart';

class PasswordEditView extends GetView<PasswordController> {
  const PasswordEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      bottomNavigationBar: CustomButton(
        text: "Save password",
        onPressed: () {},
      ).marginSymmetric(vertical: 3.h, horizontal: 10.w),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButton(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete_outline,
                    size: 20.sp,
                    color: Palette.red,
                  ),
                ),
              ],
            ).marginOnly(bottom: 3.h),
            Row(
              children: [
                CircleAvatar(
                  foregroundImage: const AssetImage("${imageAssets}default.png"),
                  backgroundColor: Palette.gray,
                  radius: 26.sp,
                ).marginOnly(right: 7.w),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Texts.regular(
                        "Adobe",
                        fontSize: 20,
                      ).marginOnly(bottom: 1.h),
                      const Texts.light(
                        "adobe@gmail.com",
                        fontSize: 10,
                        color: Palette.gray,
                      ),
                    ],
                  ),
                ),
              ],
            ).marginOnly(bottom: 3.h),
            Obx(() {
              return CustomDropdownButton(
                items: controller.items,
                value: controller.valueCheckBox(),
                controller: controller.expansionTitleController,
                onPressed: (e) {
                  controller.valueCheckBox(e);
                },
              );
            }).marginOnly(bottom: 2.h),
            Row(
              children: [
                const Texts.regular(
                  "User id",
                  fontSize: 13,
                ).marginOnly(right: 10.w, top: 10),
                const Expanded(
                  child: CustomInputOutline(
                    hintText: "adobe@gmail.com",
                  ),
                ),
              ],
            ).marginOnly(bottom: 2.h),
            Row(
              children: [
                const Texts.regular(
                  "Password",
                  fontSize: 13,
                ).marginOnly(right: 4.w, top: 10),
                const Expanded(
                  child: CustomInputOutline(
                    hintText: "amdDASmd2m3",
                  ),
                ),
              ],
            )
          ],
        ).marginSymmetric(horizontal: 6.w),
      ),
    );
  }
}
