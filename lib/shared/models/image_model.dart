class ImageTypeModel {
  final String imagePath;
  final ImageTypeEnum imageTypeEnum;

  ImageTypeModel({required this.imagePath, required this.imageTypeEnum});
}

enum ImageTypeEnum { network, file }
