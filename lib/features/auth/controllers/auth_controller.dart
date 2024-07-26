import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late PageController pageController;
  final pageIndex = 0.obs;
  @override
  void onInit() {
    pageController = PageController(initialPage: 0);

    pageController.addListener(
      () {
        pageIndex(pageController.page!.round());
      },
    );
    super.onInit();
  }
}
