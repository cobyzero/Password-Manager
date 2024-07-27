import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/colors/palette.dart';
import 'package:password_manager/core/widgets/texts.dart';
import 'package:password_manager/features/home/controllers/home_controller.dart';
import 'package:password_manager/features/home/widgets/seccions_item.dart';
import 'package:sizer/sizer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.toNamed("/profile");
                  },
                  icon: Icon(
                    Icons.person_2_outlined,
                    size: 30.sp,
                  ),
                ),
                const Texts.regular(
                  "Passwords",
                  fontSize: 17,
                ),
                IconButton(
                  onPressed: () {
                    Get.toNamed("/passwordAdd");
                  },
                  icon: Icon(
                    Icons.add_outlined,
                    size: 30.sp,
                  ),
                ),
              ],
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SeccionsItem(
                      length: 2,
                      title: "Priority",
                    ),
                    SeccionsItem(
                      length: 10,
                      title: "Work",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ).marginSymmetric(horizontal: 4.w),
      ),
    );
  }
}
