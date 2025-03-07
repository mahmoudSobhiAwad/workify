import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';

class CustomUserItem extends StatelessWidget {
  const CustomUserItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteWithOpacity10,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Text(
                "Ali Ahmed sayed",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppFontStyle.medium14,
              )),
          SizedBox(
            height: 15,
            child: VerticalDivider(
              color: AppColors.whiteff,
            ),
          ),
          Expanded(
              flex: 4,
              child: Text(
                "Flutter Developer",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppFontStyle.medium14,
              )),
          SizedBox(
            height: 15,
            child: VerticalDivider(
              color: AppColors.whiteff,
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: AppColors.purblePrimary,
                ),
                child: Center(
                    child: Text(
                  "Mid-Level",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppFontStyle.medium14,
                )),
              )),
          SizedBox(
            height: 15,
            child: VerticalDivider(
              color: AppColors.whiteff,
            ),
          ),
          Expanded(
              flex: 2,
              child: InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(AppIcons.assetsIconsThreeDotIcon))),
        ],
      ),
    );
  }
}
