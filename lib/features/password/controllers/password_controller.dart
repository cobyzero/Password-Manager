import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  final expansionTitleController = ExpansionTileController();
  final valueCheckBox = "Work".obs;
  final items = ["Work", "Priority", "College"].obs;
}
