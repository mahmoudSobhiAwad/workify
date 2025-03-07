// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.trailing,
    this.enableLeading = true,
  });
  final bool enableLeading;
  final String title;
  final List<Widget>? trailing;
  final void Function()? onBack;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: AppColors.scaffoldBackgroundColor,
      automaticallyImplyLeading: false,
      centerTitle: true,
      actions: trailing,
      leading: enableLeading
          ? IconButton(
              onPressed: onBack ?? () => context.pop(),
              icon: RotatedBox(
                  quarterTurns: 2,
                  child:
                      SvgPicture.asset(AppIcons.assetsIconsArrowRightBroken)))
          : null,
      title: Text(
        title,
        style: AppFontStyle.semiBold16,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
