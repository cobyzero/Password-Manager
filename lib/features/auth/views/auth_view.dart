import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/colors/palette.dart';
import 'package:password_manager/core/const/const.dart';
import 'package:password_manager/core/widgets/custom_button.dart';
import 'package:password_manager/core/widgets/texts.dart';
import 'package:password_manager/features/auth/controllers/auth_controller.dart';
import 'package:password_manager/features/auth/widgets/login_form.dart';
import 'package:password_manager/features/auth/widgets/register_form.dart';
import 'package:password_manager/features/auth/widgets/tab_auth.dart';
import 'package:sizer/sizer.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButton(
        text: "Get verification code",
        onPressed: () {},
        active: true,
      ).marginSymmetric(vertical: 3.h, horizontal: 5.w),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("${imageAssets}logo.png").marginOnly(bottom: 1.h),
            const Texts.bold(
              "Password Manager",
              fontSize: 25,
            ).marginOnly(bottom: 1.h),
            const Texts.regular(
              "Frictionless Security",
              fontSize: 20,
            ),
            Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.sp),
                border: Border.all(
                  width: .5.w,
                  color: Palette.black,
                ),
              ),
              width: double.infinity,
              height: 50.h,
              child: Column(
                children: [
                  Obx(() {
                    return Container(
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: .5.w,
                          color: Palette.black,
                        ),
                      ),
                      height: 10.h,
                      child: TabAuth(
                        index: controller.pageIndex(),
                        onPressed: (page) {
                          controller.pageController.jumpToPage(page);
                        },
                      ),
                    );
                  }).marginOnly(bottom: 2.h),
                  Expanded(
                    child: PageView(
                      controller: controller.pageController,
                      children: const [
                        RegisterForm(),
                        LoginForm(),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
