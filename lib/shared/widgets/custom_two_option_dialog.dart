import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/shared/features/on_boarding/presentation/widgets/custom_push_button.dart';

class CustomTwoOptionDialog extends StatelessWidget {
  const CustomTwoOptionDialog({
    super.key,
    required this.title,
    this.firstOption,
    this.backGroundColor,
    required this.buttonTitle,
    required this.onTap,
    this.iconPathBeside,
    this.isLoading = false,
  });
  final String title;
  final Widget? firstOption;
  final Color? backGroundColor;
  final String buttonTitle;
  final void Function() onTap;
  final String? iconPathBeside;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      backgroundColor: AppColors.whiteWithOpacity10,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppFontStyle.semiBold14,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                firstOption ??
                    TextButton(
                        onPressed: () => context.pop(),
                        child: Text(
                          "cancel".tr(),
                          style: AppFontStyle.medium14
                              .copyWith(color: AppColors.grayE0),
                        )),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  flex: 2,
                  child: CustomPushButton(
                    onTap: onTap,
                    isLoading: isLoading,
                    backgroundColor: backGroundColor ?? AppColors.green38,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          buttonTitle,
                          style: AppFontStyle.medium14,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SvgPicture.asset(
                          iconPathBeside ??
                              AppIcons.assetsIconsCircularCheckIcon,
                          colorFilter: const ColorFilter.mode(
                              AppColors.whiteWithOpacity10, BlendMode.srcIn),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
