import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/colors/palette.dart';
import 'package:password_manager/core/const/const.dart';
import 'package:password_manager/core/models/password_model.dart';
import 'package:password_manager/core/widgets/texts.dart';
import 'package:sizer/sizer.dart';

class PasswordItem extends StatelessWidget {
  const PasswordItem({super.key, required this.password});
  final PasswordModel password;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Get.toNamed("/passwordEdit");
            },
            child: Row(
              children: [
                CircleAvatar(
                  foregroundImage: password.image == null
                      ? const AssetImage("${imageAssets}default.png")
                      : NetworkImage(password.image!),
                  backgroundColor: Palette.gray,
                  radius: 20.sp,
                ).marginOnly(right: 4.w),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Texts.regular(
                        password.title,
                        fontSize: 12,
                      ),
                      Texts.light(
                        password.email,
                        fontSize: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.copy,
            size: 22.sp,
          ),
        ),
      ],
    );
  }
}
