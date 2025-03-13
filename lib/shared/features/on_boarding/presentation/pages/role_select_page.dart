import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workify/core/routing/routes.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/core/utils/theme/app_images.dart';
import 'package:workify/shared/features/on_boarding/presentation/widgets/custom_push_button.dart';
import 'package:workify/shared/models/role_model.dart';

class RoleSelectPage extends StatefulWidget {
  const RoleSelectPage({super.key});

  @override
  State<RoleSelectPage> createState() => _RoleSelectPageState();
}

class _RoleSelectPageState extends State<RoleSelectPage> {
  int _selectedRole = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SvgPicture.asset(AppImages.assetsImagesAppLogo),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "role_select.choose_role".tr(),
                      style: AppFontStyle.bold21,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    ...List.generate(roleList.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Column(
                          spacing: 10,
                          children: [
                            InkWell(
                              overlayColor: WidgetStatePropertyAll(
                                  AppColors.scaffoldBackgroundColor),
                              onTap: () {
                                _selectedRole = index;
                                setState(() {});
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: AppColors.whiteWithOpacity10,
                                    shape: BoxShape.circle,
                                    border: _selectedRole == index
                                        ? Border.all(
                                            width: 4,
                                            color: AppColors.purblePrimary,
                                          )
                                        : null),
                                child: SvgPicture.asset(
                                  roleList[index].imagePath,
                                ),
                              ),
                            ),
                            Text(
                              roleList[index].roleType.tr(),
                              style: AppFontStyle.semiBold18,
                            )
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
            CustomPushButton(
              onTap: _selectedRole != -1
                  ? () {
                      if (_selectedRole == 0) {
                        context.push(Routes.adminLogin);
                      } else {
                        context.push(Routes.companySelectPage);
                      }
                    }
                  : null,
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              backgroundColor: _selectedRole == -1?AppColors.whiteWithOpacity10: AppColors.purblePrimary,
              child: Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "role_select.next".tr(),
                    style: AppFontStyle.semiBold16,
                    textAlign: TextAlign.start,
                  ),
                  RotatedBox(
                    quarterTurns: context.locale.languageCode=='en'?0:2,
                    child: SvgPicture.asset(
                      AppIcons.assetsIconsArrowRightBroken,
                      height: 18,
                      width: 18,
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
