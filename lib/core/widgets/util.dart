import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/colors/palette.dart';
import 'package:password_manager/core/widgets/texts.dart';

class Util {
  static void errorSnackBar(String message, {String title = 'Error'}) {
    Get.closeAllSnackbars();
    Get.showSnackbar(
      GetSnackBar(
        titleText: Texts.bold(
          title.tr,
          color: Palette.black,
          fontSize: 12,
        ),
        messageText: Texts.regular(
          message,
          color: Palette.black,
          fontSize: 10,
        ),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        backgroundColor: Palette.red,
        icon: const Icon(
          Icons.remove_circle_outline,
          size: 32,
          color: Palette.black,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        borderRadius: 8,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static void successSnackBar(String message, {String title = 'Message'}) {
    Get.closeAllSnackbars();

    Get.showSnackbar(
      GetSnackBar(
        titleText: Texts.bold(
          title.tr,
          color: Palette.black,
          fontSize: 12,
        ),
        messageText: Texts.regular(
          message,
          color: Palette.black,
          fontSize: 10,
        ),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        backgroundColor: Palette.gray,
        icon: const Icon(
          Icons.check,
          size: 32,
          color: Palette.black,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        borderRadius: 8,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
