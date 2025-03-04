import 'package:workify/core/utils/theme/app_images.dart';

class RoleModel {
  final String roleType;
  final String imagePath;

  RoleModel({required this.roleType, required this.imagePath});
}

List<RoleModel> roleList = [
  RoleModel(roleType: "Manager", imagePath: AppImages.assetsImagesMangerLogo),
  RoleModel(roleType: "Employee", imagePath: AppImages.assetsImagesEmployeeLog),
];
