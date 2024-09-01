import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/colors/palette.dart';
import 'package:password_manager/core/const/const.dart';
import 'package:password_manager/core/widgets/custom_button_outline.dart';
import 'package:password_manager/core/widgets/texts.dart';
import 'package:password_manager/features/profile/controllers/profile_controller.dart';
import 'package:password_manager/features/profile/widgets/create_sections_sheet.dart';
import 'package:password_manager/features/profile/widgets/edit_profile_sheet.dart';
import 'package:sizer/sizer.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      appBar: AppBar(
        title: const Texts.regular(
          "Profile",
          fontSize: 17,
        ),
        backgroundColor: Palette.white,
      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            children: [
              CircleAvatar(
                foregroundImage: const AssetImage("${imageAssets}default.png"),
                backgroundColor: Palette.gray,
                radius: 40.sp,
              ).marginOnly(bottom: 4.h, top: 2.h),
              Obx(
                () {
                  return Texts.regular(
                    controller.nameUser(),
                    fontSize: 12,
                  ).marginOnly(bottom: 5.h);
                },
              ),
              CustomButtonOutline(
                text: "Edit Profile",
                width: 30.w,
                color: Palette.gray,
                textColor: Palette.black,
                onPressed: () {
                  Get.bottomSheet(
                    const EditProfileSheet(),
                    backgroundColor: Palette.white,
                  );
                },
              ),
              CustomButtonOutline(
                text: "Create Sections",
                width: 40.w,
                color: Palette.gray,
                textColor: Palette.black,
                onPressed: () {
                  Get.bottomSheet(
                    const CreateSectionSheet(),
                    backgroundColor: Palette.white,
                  );
                },
              ),
              CustomButtonOutline(
                text: "Clear Data",
                width: 40.w,
                color: Palette.red,
                onPressed: () async => await controller.clearData(),
              ),
              CustomButtonOutline(
                text: "Logout",
                width: 30.w,
                color: Palette.red,
                onPressed: () {
                  Get.offNamed("/auth");
                },
              ),
            ],
          ).marginSymmetric(horizontal: 4.w),
        ),
      ),
    );
  }
}
