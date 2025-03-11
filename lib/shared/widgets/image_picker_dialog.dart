import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';

Future<ImageSource?> showImagePickerDialog(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3), // Apply blur
      child: AlertDialog(
        backgroundColor: AppColors.black50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(
          "Choose Image",
          style: AppFontStyle.medium15,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text(
                "Take Photo ".tr(),
                style: AppFontStyle.regular14,
              ),
              onTap: () {
                context.pop(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text(
                "Choose From Gallery",
                style: AppFontStyle.regular14,
              ),
              onTap: () {
                context.pop(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    ),
  );
}
