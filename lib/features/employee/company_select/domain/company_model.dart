import 'package:workify/core/utils/theme/app_images.dart';

class CompanyModel {
  String? id;
  final String companyName;
  final String imagePath;

  CompanyModel({required this.companyName, required this.imagePath});
}

List<CompanyModel> companyList = [
  CompanyModel(companyName: "Wuzzuf", imagePath: AppImages.assetsImagesMangerLogo),
  CompanyModel(companyName: "Indeed", imagePath: AppImages.assetsImagesEmployeeLog),
  CompanyModel(companyName: "Indeed", imagePath: AppImages.assetsImagesEmployeeLog),
  CompanyModel(companyName: "Wuzzuf", imagePath: AppImages.assetsImagesMangerLogo),
  CompanyModel(companyName: "Indeed", imagePath: AppImages.assetsImagesEmployeeLog),
  CompanyModel(companyName: "Indeed", imagePath: AppImages.assetsImagesEmployeeLog),
];