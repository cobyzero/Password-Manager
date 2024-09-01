import 'package:flutter/material.dart';
import 'package:password_manager/core/colors/palette.dart';
import 'package:password_manager/core/widgets/texts.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.value,
    required this.onPressed,
    required this.controller,
  });
  final List<String> items;
  final String value;
  final Function(String) onPressed;
  final ExpansionTileController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionTile(
          controller: controller,
          tilePadding: EdgeInsets.zero,
          shape: LinearBorder.none,
          title: Texts.regular(value),
          children: items
              .map(
                (e) => ListTile(
                  onTap: () {
                    onPressed(e);
                    controller.collapse();
                  },
                  contentPadding: EdgeInsets.zero,
                  title: Text(e),
                ),
              )
              .toList(),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Palette.gray,
        ),
      ],
    );
  }
}
