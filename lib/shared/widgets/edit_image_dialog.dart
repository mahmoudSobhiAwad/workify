import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workify/core/constants/enums.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';

Future<ImageActions?> removeOrEditImagePickerDialog(
    BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3), // Apply blur
      child: AlertDialog(
        backgroundColor: AppColors.black50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text(
          "Change Or Remove Picked Image",
          style: AppFontStyle.medium15,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(
                Icons.delete_rounded,
                color: AppColors.red35,
              ),
              title: const Text(
                "Remvoe Image",
                style: AppFontStyle.regular14,
              ),
              onTap: () {
                context.pop(ImageActions.remove);
              },
            ),
            ListTile(
              leading: const Icon(Icons.change_circle_outlined),
              title: const Text(
                "Change Image",
                style: AppFontStyle.regular14,
              ),
              onTap: () {
                context.pop(ImageActions.change);
              },
            ),
          ],
        ),
      ),
    ),
  );
}
