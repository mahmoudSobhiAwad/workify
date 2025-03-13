import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';

class CustomSettingsItem extends StatelessWidget {
  const CustomSettingsItem(
      {required this.label,
      required this.iconPath,
      this.suffixIcon,
      this.onTap,
      super.key});
  final String? suffixIcon;
  final String label;
  final String iconPath;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
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
          if (suffixIcon != null) SvgPicture.asset(suffixIcon!),
        ],
      ),
    );
  }
}
