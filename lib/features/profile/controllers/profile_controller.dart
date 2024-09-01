import 'package:device_friendly_name/device_friendly_name_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/models/section_model.dart';
import 'package:password_manager/core/widgets/util.dart';
import 'package:password_manager/features/home/controllers/home_controller.dart';
import 'package:password_manager/main.dart';
import 'package:password_manager/services/section_service.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    DeviceFriendlyNamePlatform.instance.getDeviceFriendlyName().then(
      (value) {
        nameUser(value);
      },
    );
    super.onInit();
  }

  final sectionService = SectionService();
  final nameSectionController = TextEditingController();
  final homeController = Get.find<HomeController>();
  final nameUser = "".obs;

  createSection() async {
    try {
      final section = SectionModel(name: nameSectionController.text);

      await sectionService.createSection(section);
      await homeController.getSections();
      await homeController.getPasswords();

      Util.successSnackBar("Section created");
    } catch (e) {
      Util.errorSnackBar("Error in created section");
    } finally {
      nameSectionController.text = "";
    }
  }

  clearData() async {
    try {
      await databaseService.delete();
      await homeController.getSections();
      await homeController.getPasswords();
      Util.successSnackBar("Data removed");
    } catch (e) {
      Util.errorSnackBar("Error in removed data");
    }
  }
}
