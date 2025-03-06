import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/features/admin/home/presentation/widgets/custom_attendance_container.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 312,
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
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 10),
                          child: CircleAvatar(
                            radius: 30,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Hello,',
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
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 69,
                            decoration: BoxDecoration(
                              color: AppColors.whiteWithOpacity10,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Text(
                                  'Total Employees',
                                  style: AppFontStyle.bold19,
                                ),
                                Spacer(),
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: AppColors.purblePrimary,
                                  child: Text(
                                    '16',
                                    style: AppFontStyle.bold21,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          AttendanceContainer(
                              color: AppColors.green53,
                              title: 'On Time',
                              count: '8',
                              icon: AppIcons.assetsIconsCircularCheckIcon),
                          Spacer(),
                          AttendanceContainer(
                              color: AppColors.yellow3c,
                              title: 'Delayed',
                              count: '4',
                              icon: AppIcons.assetsIconsTimerIcon),
                          Spacer(),
                          AttendanceContainer(
                              color: AppColors.red35,
                              title: 'Absent',
                              count: '4',
                              icon: AppIcons.assetsIconsCircularCloseIcon),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Text(
                    'Day Movements',
                    style: AppFontStyle.bold19,
                  ),
                  Spacer(),
                  Text(
                    'See All',
                    style: AppFontStyle.regular14Purple,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 440,
              child: ListView(
                children: [
                  MovementItem(
                    name: 'ahmed',
                    inTime: '8:00 A.M',
                    outTime: '3:00 P.M',
                  ),                  MovementItem(
                    name: 'ahmed',
                    inTime: '8:00 A.M',
                    outTime: '3:00 P.M',
                  ),                  MovementItem(
                    name: 'ahmed',
                    inTime: '8:00 A.M',
                    outTime: '3:00 P.M',
                  ),                  MovementItem(
                    name: 'ahmed',
                    inTime: '8:00 A.M',
                    outTime: '3:00 P.M',
                  ),                  MovementItem(
                    name: 'ahmed',
                    inTime: '8:00 A.M',
                    outTime: '3:00 P.M',
                  ),                  MovementItem(
                    name: 'ahmed',
                    inTime: '8:00 A.M',
                    outTime: '3:00 P.M',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.whiteWithOpacity10,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.assetsIconsEmployeeIcon),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Employee Name',
                        style: AppFontStyle.regular14,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      name,
                      style: AppFontStyle.semiBold16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      inTime,
                      style: AppFontStyle.semiBold16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      outTime,
                      style: AppFontStyle.semiBold16,
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
