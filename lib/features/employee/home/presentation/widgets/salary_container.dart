import 'package:flutter/material.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';

class SalaryContainer extends StatelessWidget {
  const SalaryContainer({
    required this.color,
    required this.title,
    required this.salary,
    super.key,
  });
  final Color color;
  final String title;
  final String salary;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteWithOpacity10,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
              height: 40,
            ),
            Text(
              salary,
              style: AppFontStyle.semiBold16,
            )
          ],
        ),
      ),
    );
  }
}
