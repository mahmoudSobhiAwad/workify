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
        height: height ?? 56,
        child: ElevatedButton(
          onPressed: isLoading ? null : onTap,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            surfaceTintColor: surfaceTintColor ?? AppColors.purblePrimary,
            overlayColor: overlayColor ?? AppColors.purblePrimary,
            disabledBackgroundColor: backgroundColor,
            backgroundColor: backgroundColor ?? AppColors.purblePrimary,
            padding: padding ??
                const EdgeInsets.symmetric(
                  vertical: 17,
                ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: border ?? BorderSide.none,
            ),
            shadowColor:
                shadowColor ?? AppColors.purblePrimary, // Removes shadow effect
          ),
          child: isLoading
              ? Center(
                  child: CupertinoActivityIndicator(
                    radius: 15,
                    color: progressColor ?? AppColors.whiteff,
                  ),
                )
              : child,
        ),
      ),
    );
  }
}
