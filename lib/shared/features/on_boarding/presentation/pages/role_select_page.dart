import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workify/core/routing/routes.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/core/utils/theme/app_images.dart';
import 'package:workify/features/admin/company/presentation/pages/company_page_view.dart';
import 'package:workify/features/admin/home/presentation/pages/admin_home.dart';
import 'package:workify/features/admin/users/presentation/pages/user_page_view.dart';
import 'package:workify/shared/features/basic_preview/data/models/bottom_nav_bar_model.dart';
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
                      "Select Your Role",
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
                              roleList[index].roleType,
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
              onTap: () {
                if (_selectedRole == 0) {
                  context.go(Routes.basicPreview, extra: {
                    "pages": [
                      AdminHomePage(),
                      UserPageView(),
                      CompanyPageView(),
                      SizedBox(),
                    ],
                    "bottomNavList": [
                      BottomNavBarModel(
                          activeItemPath: AppIcons.assetsIconsHomeSelected,
                          nonActiveItemPath:
                              AppIcons.assetsIconsHomeNotSelected),
                      BottomNavBarModel(
                          activeItemPath: AppIcons.assetsIconsUsersSelected,
                          nonActiveItemPath:
                              AppIcons.assetsIconsUsersNotSelected),
                      BottomNavBarModel(
                          activeItemPath: AppIcons.assetsIconsCompanySelected,
                          nonActiveItemPath:
                              AppIcons.assetsIconsCompanyNotSelected),
                      BottomNavBarModel(
                          activeItemPath: AppIcons.assetsIconsSelectedSetting,
                          nonActiveItemPath:
                              AppIcons.assetsIconsSettingNotSelected),
                    ],
                  });
                } else {
                  //TODO edit to go to employee
                }
              },
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              backgroundColor: AppColors.purblePrimary,
              child: Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Next",
                    style: AppFontStyle.semiBold16,
                    textAlign: TextAlign.start,
                  ),
                  SvgPicture.asset(
                    AppIcons.assetsIconsArrowRightBroken,
                    height: 18,
                    width: 18,
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
