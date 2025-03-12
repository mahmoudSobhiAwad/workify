import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';

class MovementItem extends StatelessWidget {
  const MovementItem({
    required this.name,
    required this.inTime,
    required this.outTime,
    super.key,
  });
  final String name;
  final String inTime;
  final String outTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppColors.whiteWithOpacity10,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppIcons.assetsIconsEmployeeIcon),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Emp Name',
                    style: AppFontStyle.regular14,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: AppFontStyle.semiBold16,
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppIcons.assetsIconsCheckIn),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Check In',
                    style: AppFontStyle.regular14,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                inTime,
                style: AppFontStyle.semiBold16,
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppIcons.assetsIconsCheckOut),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Check Out',
                    style: AppFontStyle.regular14,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                outTime,
                style: AppFontStyle.semiBold16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
