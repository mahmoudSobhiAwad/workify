import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/shared/features/basic_preview/data/models/bottom_nav_bar_model.dart';

final List<BottomNavBarModel> adminHomeNavBarList = [
  BottomNavBarModel(
      activeItemPath: AppIcons.assetsIconsHomeSelected,
      nonActiveItemPath: AppIcons.assetsIconsHomeNotSelected),
  BottomNavBarModel(
      activeItemPath: AppIcons.assetsIconsUsersSelected,
      nonActiveItemPath: AppIcons.assetsIconsUsersNotSelected),
  BottomNavBarModel(
      activeItemPath: AppIcons.assetsIconsCompanySelected,
      nonActiveItemPath: AppIcons.assetsIconsCompanyNotSelected),
  BottomNavBarModel(
      activeItemPath: AppIcons.assetsIconsSelectedSetting,
      nonActiveItemPath: AppIcons.assetsIconsSettingNotSelected),
];

final List<BottomNavBarModel> employeeHomeNavBarList = [
  BottomNavBarModel(
      activeItemPath: AppIcons.assetsIconsHomeSelected,
      nonActiveItemPath: AppIcons.assetsIconsHomeNotSelected),
  BottomNavBarModel(
      activeItemPath: AppIcons.assetsIconsFingerPrintSelected,
      nonActiveItemPath: AppIcons.assetsIconsFingerPrintNotSelected),
  BottomNavBarModel(
      activeItemPath: AppIcons.assetsIconsSelectedSetting,
      nonActiveItemPath: AppIcons.assetsIconsSettingNotSelected),
];
