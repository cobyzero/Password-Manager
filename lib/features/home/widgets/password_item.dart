import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/colors/palette.dart';
import 'package:password_manager/core/const/const.dart';
import 'package:password_manager/core/models/password_model.dart';
import 'package:password_manager/core/widgets/custom_image_button.dart';
import 'package:password_manager/core/widgets/texts.dart';
import 'package:password_manager/core/widgets/util.dart';
import 'package:password_manager/services/auth_service.dart';
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
              Get.toNamed("/passwordEdit", arguments: password);
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
                        password.name,
                        fontSize: 12,
                      ).marginOnly(bottom: 1.h),
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
        CustomImageButton(
          onTap: () async {
            try {
              final auth = await AuthService().login();
              if (!auth) {
                Util.errorSnackBar("Not authenticated");
              }
              FlutterClipboard.copy(password.password).then(
                (value) {
                  Util.successSnackBar("Copied to clipboard");
                },
              );
            } catch (e) {
              Util.errorSnackBar("Error in authenticated");
            }
          },
          image: "copy.png",
        ),
      ],
    );
  }
}
