import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/colors/palette.dart';
import 'package:password_manager/core/models/section_model.dart';
import 'package:password_manager/core/widgets/custom_image_button.dart';
import 'package:password_manager/core/widgets/texts.dart';
import 'package:password_manager/features/home/controllers/home_controller.dart';
import 'package:password_manager/features/home/widgets/seccions_item.dart';
import 'package:sizer/sizer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.white,
        title: const Texts.regular(
          "Passwords",
          fontSize: 17,
        ),
        leading: CustomImageButton(
          onTap: () {
            Get.toNamed("/profile");
          },
          image: "profile.png",
        ),
        actions: [
          CustomImageButton(
            onTap: () {
              Get.toNamed("/passwordAdd");
            },
            image: "add.png",
          ),
        ],
      ),
      backgroundColor: Palette.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.sections.map(
                    (element) {
                      return SeccionsItem(
                        section: element,
                        passwords: controller.passwords
                            .where(
                              (p0) => p0.sectionId == element.id,
                            )
                            .toList(),
                      );
                    },
                  ).toList(),
                ),
              );
            }),
            Obx(() {
              return Expanded(
                child: SingleChildScrollView(
                  child: SeccionsItem(
                    section: SectionModel(name: "All"),
                    passwords: controller.passwords
                        .where(
                          (p0) => p0.sectionId == null,
                        )
                        .toList(),
                  ),
                ),
              );
            }),
          ],
        ).marginSymmetric(horizontal: 4.w),
      ),
    );
  }
}
