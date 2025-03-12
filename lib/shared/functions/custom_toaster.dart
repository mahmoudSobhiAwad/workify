import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';

class CustomToast {
  final BuildContext? context;
  final String header;
  final String? description;
  ToastificationType? type;

  CustomToast(
      {required this.context,
      required this.header,
      this.description,
      this.type = ToastificationType.error});

  void showBottomToast() {
    toastification.show(
      style: ToastificationStyle.fillColored,
      alignment: Alignment.bottomCenter,
      type: type,
      showIcon: false,
      context: context,
      title: Text(
        header,
        style: AppFontStyle.medium14,
      ),
      description: description != null
          ? Text(
              description!,
              style: AppFontStyle.regular14,
            )
          : null,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }
}
