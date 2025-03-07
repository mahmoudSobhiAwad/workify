import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/core/utils/theme/app_images.dart';

class FingerPrint extends StatelessWidget {
  const FingerPrint({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Center(
              child: Container(
                width: 120,
                height: 120,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.whiteWithOpacity10,
                ),
                child: SvgPicture.asset(
                  AppImages.assetsImagesEmployeeLog,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'John Doe',
              style: AppFontStyle.bold19,
            ),
            SizedBox(height: 40),
            Container(
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(24)),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppIcons.assetsIconsCheckInFingerprint,
                    width: 64,
                    height: 64,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Check In',
                    style: AppFontStyle.bold23.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                color: AppColors.black30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppIcons.assetsIconsCheckOutFingerprint,
                    width: 64,
                    height: 64,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Check Out',
                    style: AppFontStyle.bold23.copyWith(color: Colors.white),
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
