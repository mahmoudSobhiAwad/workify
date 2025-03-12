import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_images.dart';

class EmptyWidgetState extends StatelessWidget {
  const EmptyWidgetState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: SvgPicture.asset(AppImages.assetsImagesEmptyState)),
        Center(
          child: Text(
            'There is No Data Try to Add New',
            style: AppFontStyle.semiBold22,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
