import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/models/password_model.dart';
import 'package:password_manager/core/widgets/texts.dart';
import 'package:password_manager/features/home/widgets/password_item.dart';
import 'package:sizer/sizer.dart';

class SeccionsItem extends StatelessWidget {
  const SeccionsItem({
    super.key,
    required this.length,
    required this.title,
  });
  final int length;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Texts.regular(
          title,
          fontSize: 13,
        ).marginOnly(bottom: 3.h, top: 4.h),
        SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(length, (int index) => index).map(
                (e) {
                  return PasswordItem(
                    password: PasswordModel(
                      title: "Adobe",
                      email: "adobe@gmail.com",
                    ),
                  ).marginSymmetric(vertical: 1.h);
                },
              ).toList()),
        ),
      ],
    );
  }
}
