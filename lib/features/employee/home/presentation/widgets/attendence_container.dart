import 'package:flutter/material.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';

class AttendanceContainer extends StatelessWidget {
  const AttendanceContainer({
    required this.color,
    required this.title,
    required this.count,
    super.key,
  });
  final Color color;
  final String title;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 166,
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.whiteWithOpacity10,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title),
                SizedBox(width: 5),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 25,
              backgroundColor: color,
              child: Text(
                count,
                style: AppFontStyle.bold16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
