import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';

class DialogHelper {
  static void showCustomDialog({
    required BuildContext context,
    required TapDownDetails details,
    void Function()? firstOptionFunction,
    void Function()? secondOptionFunction,
    String? menuTitle,
    String? firstOptionTitle,
    String? secondOptionTitle,
    String firstOptionIcon = AppIcons.assetsIconsEditIcon,
    String secondOptionIcon = AppIcons.assetsIconsDeleteIcon,
    Color secondOptionIconColor = AppColors.whiteff,
    Color firstOptionIconColor = AppColors.whiteff,
    Color? firstOptionColor,
    Color? secondOptionColor,
    String? thirdOptionTitle,
    Color? thirdOptionColor,
    bool withIcons = true,
    bool rightAligned = false,
    bool center = false,
    bool isThirdOtional = false,
    bool isSecondOptional = true,
  }) {
    // Calculate position from top based on tap position
    final double topPosition = details.globalPosition.dy;

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 1.5,
                  sigmaY: 1.5,
                ),
                child: Container(color: AppColors.blackWithOpacity5),
              ),
            ),
            Positioned(
              left: center
                  ? null
                  : rightAligned
                      ? null
                      : 16,
              right: center
                  ? null
                  : rightAligned
                      ? 16
                      : null,
              top: topPosition - 40,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteWithOpacity10,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blackWithOpacity5,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      menuTitle != null
                          ? Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                menuTitle,
                                style: AppFontStyle.semiBold16.copyWith(
                                  color: firstOptionColor ?? AppColors.black50,
                                ),
                              ),
                            )
                          : const SizedBox(height: 24),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          firstOptionFunction?.call();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (withIcons) ...[
                                SvgPicture.asset(
                                  firstOptionIcon,
                                  width: 20,
                                  colorFilter: ColorFilter.mode(
                                    firstOptionIconColor,
                                    BlendMode.srcIn,
                                  ),
                                  fit: BoxFit.scaleDown,
                                ),
                                const SizedBox(width: 5),
                              ],
                              Text(
                                firstOptionTitle ?? "Change",
                                style: AppFontStyle.regular14.copyWith(
                                  color: firstOptionColor ?? AppColors.black50,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      isSecondOptional
                          ? Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    secondOptionFunction?.call();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (withIcons) ...[
                                          SvgPicture.asset(
                                            secondOptionIcon,
                                            width: 20,
                                            colorFilter: ColorFilter.mode(
                                              secondOptionIconColor,
                                              BlendMode.srcIn,
                                            ),
                                            fit: BoxFit.scaleDown,
                                          ),
                                          const SizedBox(width: 5),
                                        ],
                                        Text(
                                          secondOptionTitle ?? "delete".tr(),
                                          style:
                                              AppFontStyle.regular14.copyWith(
                                            color: secondOptionColor ??
                                                AppColors.black50,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
