import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/colors/palette.dart';
import 'package:password_manager/core/const/const.dart';
import 'package:password_manager/core/widgets/texts.dart';
import 'package:password_manager/features/auth/controllers/auth_controller.dart';
import 'package:sizer/sizer.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("${imageAssets}logo.png").marginOnly(bottom: 1.h),
              const Texts.bold(
                "Password Manager",
                fontSize: 18,
              ).marginOnly(bottom: 1.h),
              const Texts.regular(
                "Frictionless Security",
                fontSize: 15,
              ),
              GestureDetector(
                onTap: controller.login,
                child: Container(
                  height: 50.w,
                  width: 50.w,
                  margin: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 3.w,
                  ),
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.sp),
                    border: Border.all(
                      width: .5.w,
                      color: Palette.black,
                    ),
                  ),
                  child: Image.asset(
                    "${imageAssets}auth.png",
                    color: Palette.red,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
