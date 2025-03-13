import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/features/admin/home/presentation/widgets/custom_attendance_container.dart';

import 'package:workify/features/admin/home/presentation/cubit/home_cubit.dart';

class QuickOverView extends StatelessWidget {
  const QuickOverView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit=context.read<HomeCubit>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        color: AppColors.purblePrimary,
        gradient: RadialGradient(
          center: Alignment(0, -0.92),
          radius: 1.5,
          colors: [
            AppColors.purblePrimary,
            AppColors.purblePrimary.withValues(alpha: 0),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'admin_home.hello'.tr(),
                    style: AppFontStyle.medium15,
                  ),
                  Text(
                    'Mahmoud',
                    style: AppFontStyle.bold15,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.whiteWithOpacity10,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'admin_home.total'.tr(),
                  style: AppFontStyle.bold19,
                ),
                Spacer(),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.purblePrimary,
                  child: Text(
                    cubit.movements.length.toString(),
                    style: AppFontStyle.bold21,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(3, (index) {
                return [
                  AttendanceContainer(
                      color: AppColors.green53,
                      title: 'admin_home.on_time'.tr(),
                      count: '0',
                      icon: AppIcons.assetsIconsCircularCheckIcon),
                  AttendanceContainer(
                      color: AppColors.yellow3c,
                      title: 'admin_home.delayed'.tr(),
                      count: '1',
                      icon: AppIcons.assetsIconsTimerIcon),
                  AttendanceContainer(
                      color: AppColors.red35,
                      title: 'admin_home.absent'.tr(),
                      count: '0',
                      icon: AppIcons.assetsIconsCircularCloseIcon),
                ][index];
              }),
            ],
          )
        ],
      ),
    );
  }
}
