import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workify/core/utils/theme/app_colors.dart';

class CustomPushButton extends StatelessWidget {
  const CustomPushButton({
    super.key,
    this.margin,
    this.padding,
    this.child,
    this.onTap,
    this.backgroundColor,
    this.border,
    this.height,
    this.isLoading = false,
    this.overlayColor,
    this.shadowColor,
    this.surfaceTintColor,
    this.progressColor,
  });

  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget? child;
  final Color? backgroundColor;
  final void Function()? onTap;
  final BorderSide? border;
  final double? height;
  final bool isLoading;
  final Color? overlayColor;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final Color? progressColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: SizedBox(
        height: height ?? 52,
        child: ElevatedButton(
          onPressed: isLoading ? null : onTap,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            surfaceTintColor: surfaceTintColor ?? AppColors.black50,
            overlayColor: overlayColor ?? AppColors.black50,
            disabledBackgroundColor: backgroundColor,
            backgroundColor: backgroundColor ?? AppColors.purblePrimary,
            padding: padding ??
                const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
              side: border ?? BorderSide.none,
            ),
            shadowColor: shadowColor ?? AppColors.black50,
          ),
          child: isLoading
              ? Center(
                  child: CupertinoActivityIndicator(
                    radius: 15,
                    color: progressColor ?? AppColors.black50,
                  ),
                )
              : child,
        ),
      ),
    );
  }
}
