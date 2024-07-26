import 'package:flutter/material.dart';
import 'package:password_manager/core/colors/palette.dart';

class TabAuth extends StatefulWidget {
  const TabAuth({
    super.key,
    required this.index,
    required this.onPressed,
  });
  final int index;
  final Function(int page) onPressed;
  @override
  State<TabAuth> createState() => _TabAuthState();
}

class _TabAuthState extends State<TabAuth> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: InkWell(
            onTap: () => widget.onPressed(0),
            child: animationContainer(widget.index == 0),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () => widget.onPressed(1),
            child: animationContainer(widget.index == 1),
          ),
        ),
      ],
    );
  }

  animationContainer(bool active) {
    return AnimatedContainer(
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: active ? Palette.black : Palette.white),
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }
}
