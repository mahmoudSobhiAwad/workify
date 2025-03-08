import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';

class CustomSettingsItem extends StatelessWidget {
  CustomSettingsItem(
      {required this.label,
      required this.iconPath,
      this.suffixIcon,
      super.key});
  String? suffixIcon;
  final String label;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        SizedBox(
          width: 10,
        ),
        Text(
          label,
          style: AppFontStyle.regular16,
        ),
        Spacer(),
        SvgPicture.asset(suffixIcon.toString()),
      ],
    );
  }
}
