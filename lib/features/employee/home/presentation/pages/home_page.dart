import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/features/employee/home/presentation/widgets/attendence_container.dart';
import 'package:workify/features/employee/home/presentation/widgets/movement_item.dart';
import 'package:workify/features/employee/home/presentation/widgets/salary_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                color: AppColors.purblePrimary,
                gradient: RadialGradient(
                  center: Alignment(0, -1),
                  radius: 2,
                  colors: [
                    Color(0xff7B61FF),
                    Color(0xff7B61FF).withAlpha(0),
                  ],
                ),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(radius: 30),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello,',
                            style: AppFontStyle.medium15,
                          ),
                          Text(
                            'Mahmoud',
                            style: AppFontStyle.bold13,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SalaryContainer(
                        color: AppColors.green53,
                        title: 'Total Salary',
                        salary: '12,000 LE',
                      ),
                      Spacer(),
                      AttendanceContainer(
                        color: AppColors.green53,
                        title: 'Leave Balance',
                        count: '4',
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Text(
                    'Movements',
                    style: AppFontStyle.bold19,
                  ),
                  Spacer(),
                  SvgPicture.asset(AppIcons.assetsIconsDatePickerIcon)
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom:
                      80, // Added bottom padding to account for bottom nav bar
                ),
                children: [
                  MovementItem(
                    name: 'ahmed',
                    inTime: '8:00 A.M',
                    outTime: '3:00 P.M',
                  ),
                  MovementItem(
                    name: 'ahmed',
                    inTime: '8:00 A.M',
                    outTime: '3:00 P.M',
                  ),
                  MovementItem(
                    name: 'ahmed',
                    inTime: '8:00 A.M',
                    outTime: '3:00 P.M',
                  ),
                  MovementItem(
                    name: 'ahmed',
                    inTime: '8:00 A.M',
                    outTime: '3:00 P.M',
                  ),
                  MovementItem(
                    name: 'ahmed',
                    inTime: '8:00 A.M',
                    outTime: '3:00 P.M',
                  ),
                  MovementItem(
                    name: 'ahmed',
                    inTime: '8:00 A.M',
                    outTime: '3:00 P.M',
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
