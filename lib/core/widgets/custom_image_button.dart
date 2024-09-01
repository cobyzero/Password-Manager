import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/const/const.dart';
import 'package:sizer/sizer.dart';

class CustomImageButton extends StatelessWidget {
  const CustomImageButton({
    super.key,
    required this.onTap,
    required this.image,
  });
  final Function() onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        "$imageAssets$image",
      ),
    ).marginAll(2.w);
  }
}
