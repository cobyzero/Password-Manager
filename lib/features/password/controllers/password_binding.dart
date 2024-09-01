import 'package:get/get.dart';
import 'package:password_manager/features/password/controllers/password_controller.dart';

class PasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PasswordController(),
    );
  }
}
