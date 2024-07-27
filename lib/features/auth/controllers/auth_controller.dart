import 'package:get/get.dart';
import 'package:password_manager/core/widgets/util.dart';
import 'package:password_manager/services/auth_service.dart';

class AuthController extends GetxController {
  final authService = AuthService();

  login() async {
    try {
      final bool isAuthenticate = await authService.login();

      if (!isAuthenticate) {
        throw "not authenticate";
      }
      Get.offNamed("/home");
      Util.successSnackBar("Successfully authenticated");
    } catch (e) {
      Util.errorSnackBar("Authentication error");
    }
  }
}
