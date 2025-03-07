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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.whiteWithOpacity10,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.assetsIconsEmployeeIcon),
                        SizedBox(width: 4),
                        Text(
                          'Employee Name',
                          style: AppFontStyle.regular12,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 10.0),
                    child: Text(
                      name,
                      style: AppFontStyle.semiBold14,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.assetsIconsCheckIn),
                      SizedBox(width: 4),
                      Text(
                        'Check In',
                        style: AppFontStyle.regular12,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                    child: Text(
                      inTime,
                      style: AppFontStyle.semiBold14,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.assetsIconsCheckOut),
                      SizedBox(width: 4),
                      Text(
                        'Check Out',
                        style: AppFontStyle.regular12,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                    child: Text(
                      outTime,
                      style: AppFontStyle.semiBold14,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}