import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/models/password_model.dart';
import 'package:password_manager/core/models/section_model.dart';
import 'package:password_manager/core/widgets/util.dart';
import 'package:password_manager/features/home/controllers/home_controller.dart';
import 'package:password_manager/services/auth_service.dart';
import 'package:password_manager/services/password_service.dart';
import 'package:password_manager/services/section_service.dart';

class PasswordController extends GetxController {
  @override
  void onInit() {
    if (Get.arguments is PasswordModel) {
      passwordEditSelected = Get.arguments;
    }
    getSections();
    super.onInit();
  }

  final expansionTitleController = ExpansionTileController();
  final sectionService = SectionService();
  final passwordService = PasswordService();
  final authService = AuthService();
  final sections = <SectionModel>[].obs;
  final loadingSections = true.obs;
  final homeController = Get.find<HomeController>();
  final nameAddController = TextEditingController();
  final emailAddController = TextEditingController();
  final valueAddCheckBox = "".obs;
  final passwordAddController = TextEditingController();
  late PasswordModel passwordEditSelected;

  getSections() async {
    try {
      loadingSections(true);
      sections.clear();
      final sectionsData = await sectionService.getAllSections();
      if (sectionsData.isNotEmpty) {
        sections.addAll(sectionsData);
        valueAddCheckBox(sections.first.name);
      }
    } catch (e) {
      Util.errorSnackBar("Error in sections");
    } finally {
      loadingSections(false);
    }
  }

  createPassword() async {
    try {
      final password = PasswordModel(
        name: nameAddController.text,
        email: emailAddController.text,
        password: passwordAddController.text,
        sectionId: valueAddCheckBox().isEmpty
            ? null
            : sections
                .firstWhere(
                  (element) => element.name == valueAddCheckBox(),
                )
                .id,
      );

      await passwordService.createPassword(password);

      Util.successSnackBar("Created password");
    } catch (e) {
      Util.errorSnackBar("Error in created password");
    } finally {
      await homeController.getSections();
      await homeController.getPasswords();
    }
  }

  Future<bool> authenticate() async => await authService.login();
}
