import 'package:flutter/material.dart';
import 'package:password_manager/core/colors/palette.dart';
import 'package:password_manager/core/widgets/texts.dart';
import 'package:sizer/sizer.dart';

class TabAuth extends StatefulWidget {
  const TabAuth({
    super.key,
    required this.index,
    required this.onPressed,
    required this.tabModel,
  });
  final int index;
  final Function(int page) onPressed;
  final List<TabModel> tabModel;
  @override
  State<TabAuth> createState() => _TabAuthState();
}

class _TabAuthState extends State<TabAuth> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.tabModel
          .map(
            (e) => Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(7.sp),
                onTap: () => widget.onPressed(e.index),
                child: animationContainer(widget.index == e.index, e.title),
              ),
            ),
          )
          .toList(),
    );
  }

  animationContainer(bool active, String title) {
    return AnimatedContainer(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        color: active ? Palette.black : Palette.white,
        borderRadius: BorderRadius.circular(7.sp),
      ),
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      child: Texts.regular(
        title,
        color: active ? Palette.white : Palette.black,
        fontSize: 13,
      ),
    );
  }
}

class TabModel {
  final String title;
  final int index;

  TabModel({required this.title, required this.index});
}
