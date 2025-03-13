import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_images.dart';

class ErrorWidgetState extends StatelessWidget {
  const ErrorWidgetState({
    super.key,
    required this.errMessage,
  });
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: SvgPicture.asset(AppImages.errorImages)),
        Text(
          errMessage,
          style: AppFontStyle.semiBold22,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
