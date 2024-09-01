import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/colors/palette.dart';
import 'package:password_manager/core/widgets/custom_button.dart';
import 'package:password_manager/core/widgets/custom_dropdown_button.dart';
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
      appBar: AppBar(
        title: const Texts.regular(
          "New password",
          fontSize: 17,
        ),
        backgroundColor: Palette.white,
      ),
      backgroundColor: Palette.white,
      bottomNavigationBar: CustomButton(
        text: "Create password",
        onPressed: () async => await controller.createPassword(),
      ).marginSymmetric(vertical: 3.h, horizontal: 10.w),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Texts.regular(
                  "Name",
                  fontSize: 12,
                ).marginOnly(right: 10.w),
                Expanded(
                  child: CustomInputOutline(
                    hintText: "website or app name",
                    controller: controller.nameAddController,
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
                ).marginOnly(right: 9.w),
                Expanded(
                  child: CustomInputOutline(
                    hintText: "username or email id",
                    controller: controller.emailAddController,
                  ),
                ),
                Icon(
                  Icons.check_circle_outline,
                  color: Palette.green,
                  size: 18.sp,
                ).marginOnly(left: 8.w, top: 1.h),
              ],
            ).marginOnly(bottom: 2.h),
            Obx(() {
              if (controller.loadingSections()) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (controller.sections.isEmpty) {
                return const SizedBox.shrink();
              }

              return CustomDropdownButton(
                items: controller.sections
                    .map(
                      (element) => element.name,
                    )
                    .toList(),
                value: controller.valueAddCheckBox(),
                controller: controller.expansionTitleController,
                onPressed: (e) {
                  controller.valueAddCheckBox(e);
                },
              );
            }).marginOnly(bottom: 4.h),
            CustomInput(
              hintText: "Password",
              controller: controller.passwordAddController,
            ),
          ],
        ).marginSymmetric(horizontal: 6.w).marginOnly(top: 2.h),
      ),
    );
  }
}
