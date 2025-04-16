import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/features/employee/finger_print/data/models/movement_model.dart';

class MovementItem extends StatelessWidget {
  const MovementItem({
    required this.model,
    super.key,
  });
  final MovementModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.whiteWithOpacity10,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 2),
              child: Text(
                DateFormat('dd MMMM yyyy')
                    .format(model.checkIn ?? DateTime.now()),
                style: AppFontStyle.medium14,
              ),
            ),
            Row(
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
                              "emp_home.emp_name".tr(),
                              style: AppFontStyle.regular12,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, top: 10.0),
                        child: Text(
                          model.fullName ?? "",
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
                            "emp_home.check_in".tr(),
                            style: AppFontStyle.regular12,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                        child: Text(
                          formatDateTime(model.checkIn ?? DateTime.now()),
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
                            "emp_home.check_out".tr(),
                            style: AppFontStyle.regular12,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                        child: Text(
                          model.checkOut != null
                              ? formatDateTime(model.checkOut ?? DateTime.now())
                              : "--",
                          style: AppFontStyle.semiBold14,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String formatDateTime(DateTime dateTime) {
  return DateFormat('h:mm a').format(dateTime); // Converts to "10:38 PM"
}
