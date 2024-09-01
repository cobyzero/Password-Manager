import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/widgets/custom_button.dart';
import 'package:password_manager/core/widgets/custom_input.dart';
import 'package:password_manager/core/widgets/texts.dart';
import 'package:password_manager/features/profile/controllers/profile_controller.dart';
import 'package:sizer/sizer.dart';

class CreateSectionSheet extends GetView<ProfileController> {
  const CreateSectionSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Texts.regular(
              "Create Section",
              fontSize: 15,
            ).marginOnly(bottom: 4.h),
            CustomInput(
              controller: controller.nameSectionController,
              label: "Name",
            ).marginOnly(bottom: 2.h),
            CustomButton(
              text: "Create section",
              onPressed: () async => await controller.createSection(),
            ).marginOnly(bottom: 4.h),
          ],
        ),
      ),
    );
  }
}
