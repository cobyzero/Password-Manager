import 'package:flutter/material.dart';
import 'package:password_manager/core/colors/palette.dart';
import 'package:password_manager/core/widgets/texts.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.active = true,
  });
  final String text;
  final Function() onPressed;
  final bool active;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(100.w, 5.h),
        backgroundColor: widget.active ? Palette.black : Palette.white,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
          side: BorderSide(
            color: widget.active ? Palette.black : Palette.gray,
          ),
        ),
      ),
      child: Texts.regular(
        widget.text,
        color: widget.active ? Palette.white : Palette.gray,
      ),
    );
  }
}
