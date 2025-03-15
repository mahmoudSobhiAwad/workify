import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workify/core/storage/cache_helper.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/core/utils/theme/app_images.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "settings.settings".tr(),
                style: AppFontStyle.bold23,
              ),
              SizedBox(height: 24),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF3E4752),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFF7E57C2),
                          width: 2,
                        ),
                      ),
                      child: ClipOval(
                        child: Center(
                          child: SvgPicture.asset(
                            AppImages.assetsImagesEmployeeLog,
                            fit: BoxFit.cover,
                            width: 48,
                            height: 48,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John Doe',
                            style: AppFontStyle.semiBold16
                                .copyWith(color: Colors.white),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'john.doe@example.com',
                            style: AppFontStyle.regular14
                                .copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
             
              ListTile(
                leading: SvgPicture.asset(AppIcons.assetsIconsChangePassIcon),
                title: Text(
                  "settings.change_password".tr(),
                  style: AppFontStyle.medium15,
                ),
                onTap: () {
                  // Handle password change
                },
              ),
              ListTile(
                leading: SvgPicture.asset(AppIcons.assetsIconsLogOutIcon),
                title: Text("settings.logout".tr(), style: AppFontStyle.medium15),
                onTap: () async {
                  await AppSharedPreferences.clearAll();

                  // Handle logout
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
