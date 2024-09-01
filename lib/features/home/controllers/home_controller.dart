import 'package:get/get.dart';
import 'package:password_manager/core/models/password_model.dart';
import 'package:password_manager/core/models/section_model.dart';
import 'package:password_manager/core/widgets/util.dart';
import 'package:password_manager/services/password_service.dart';
import 'package:password_manager/services/section_service.dart';

class HomeController extends GetxController {
  final passwords = <PasswordModel>[].obs;
  final sections = <SectionModel>[].obs;
  final passwordService = PasswordService();
  final sectionService = SectionService();
  final loading = true.obs;

  @override
  Future<void> onInit() async {
    await getSections();
    await getPasswords();
    loading(false);
    super.onInit();
  }

  getPasswords() async {
    try {
      passwords.clear();
      final passwordsData = await passwordService.getAllPasswords();
      if (passwordsData.isNotEmpty) {
        passwords.addAll(passwordsData);
      }
    } catch (e) {
      Util.errorSnackBar("Error in passwords");
    }
  }

  getSections() async {
    try {
      sections.clear();
      final sectionsData = await sectionService.getAllSections();
      if (sectionsData.isNotEmpty) {
        sections.addAll(sectionsData);
      }
    } catch (e) {
      Util.errorSnackBar("Error in sections");
    }
  }
}
