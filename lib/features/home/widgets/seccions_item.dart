import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/core/models/password_model.dart';
import 'package:password_manager/core/models/section_model.dart';
import 'package:password_manager/core/widgets/texts.dart';
import 'package:password_manager/features/home/widgets/password_item.dart';
import 'package:sizer/sizer.dart';

class SeccionsItem extends StatelessWidget {
  const SeccionsItem({
    super.key,
    required this.section,
    required this.passwords,
  });
  final SectionModel section;
  final List<PasswordModel> passwords;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Texts.regular(
          section.name,
          fontSize: 13,
        ).marginOnly(bottom: 3.h, top: 4.h),
        SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: passwords.map(
                (e) {
                  return PasswordItem(
                    password: PasswordModel(
                      name: e.name,
                      email: e.email,
                      password: e.password,
                      sectionId: 1,
                    ),
                  ).marginSymmetric(vertical: 1.h);
                },
              ).toList()),
        ),
      ],
    );
  }
}
