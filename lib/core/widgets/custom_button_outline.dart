import 'package:flutter/material.dart';
import 'package:password_manager/core/colors/palette.dart';
import 'package:password_manager/core/widgets/texts.dart';
import 'package:sizer/sizer.dart';

class CustomButtonOutline extends StatefulWidget {
  const CustomButtonOutline({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.width,
  });
  final String text;
  final Function() onPressed;
  final Color? color;
  final Color? textColor;
  final double? width;
  @override
  State<CustomButtonOutline> createState() => _CustomButtonOutlineState();
}

class _CustomButtonOutlineState extends State<CustomButtonOutline> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(widget.width ?? 100.w, 4.h),
        backgroundColor: Palette.white,
        shape: StadiumBorder(
          side: BorderSide(
            color: widget.color ?? Palette.black,
          ),
        ),
      ),
      child: Texts.regular(
        widget.text,
        color: widget.textColor ?? (widget.color ?? Palette.black),
        fontSize: 10,
      ),
    );
  }
}
