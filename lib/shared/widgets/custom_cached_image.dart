
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:workify/core/utils/theme/app_colors.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage(
      {super.key, this.width, this.hight, required this.imagePath, this.fit});
  final double? width, hight;
  final String imagePath;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: hight,
      fit:fit?? BoxFit.cover,
      imageUrl: imagePath,
      errorListener: (value) {},
      errorWidget: (context, url, error) => Container(
        width: width,
        height: hight,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.blackWithOpacity5
        ),
       
      ),
      progressIndicatorBuilder: (context, url, progress) => Container(
        width: width,
        height: hight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.whiteWithOpacity10,
        ),
        child: SizedBox(
          width: 30,
          height: 30,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: CircularProgressIndicator(
              value: progress.progress,
              color: AppColors.whiteff,
              strokeCap: StrokeCap.round,
            ),
          ),
        ),
      ),
    );
  }
}
