import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workify/core/storage/cache_helper.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/shared/features/settings/presentation/widgets/custom_settings_item.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "settings.settings".tr(),
            style: AppFontStyle.bold22,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.whiteWithOpacity10,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 32,
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mahmoud Sobhi",
                      style: AppFontStyle.medium16,
                    ),
                    Text(
                      "ali.obaidy178@gmail.com",
                      style: AppFontStyle.regular14,
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SvgPicture.asset(AppIcons.assetsIconsLanguageIcon),
              SizedBox(
                width: 10,
              ),
              Text(
                "settings.language".tr(),
                style: AppFontStyle.regular16,
              ),
              Spacer(),
              Text(
                context.locale.languageCode == 'ar' ? 'العربية' : "English",
                style: AppFontStyle.regular16,
              ),
              SizedBox(
                width: 10,
              ),
              PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      onTap: () {
                        context.setLocale(
                          Locale('en'),
                        );
                      },
                      child: Text("English"),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        context.setLocale(
                          Locale('ar'),
                        );
                      },
                      child: Text("العربية"),
                    ),
                  ];
                },
                child: SvgPicture.asset(AppIcons.assetsIconsArrowDownIcon),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          CustomSettingsItem(
            label: 'settings.change_password'.tr(),
            iconPath: AppIcons.assetsIconsChangePassIcon,
          ),
          SizedBox(
            height: 30,
          ),
          CustomSettingsItem(
            onTap: () async {
              print("d");
              await AppSharedPreferences.clearAll();
            },
            label: 'settings.logout'.tr(),
            iconPath: AppIcons.assetsIconsLogOutIcon,
          )
        ],
      ),
    );
  }
}
