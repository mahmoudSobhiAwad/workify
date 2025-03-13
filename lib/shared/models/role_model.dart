import 'package:workify/core/utils/theme/app_images.dart';

class RoleModel {
  final String roleType;
  final String imagePath;

  RoleModel({required this.roleType, required this.imagePath});
}

List<RoleModel> roleList = [
  RoleModel(roleType: "role_select.manager", imagePath: AppImages.assetsImagesMangerLogo),
  RoleModel(roleType: "role_select.emp", imagePath: AppImages.assetsImagesEmployeeLog),
];
