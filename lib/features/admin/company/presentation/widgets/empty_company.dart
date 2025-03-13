import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workify/core/routing/routes.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_images.dart';
import 'package:workify/shared/features/on_boarding/presentation/widgets/custom_push_button.dart';

class ComapnyEmptyStateView extends StatelessWidget {
  const ComapnyEmptyStateView({
    super.key,
    required this.companyId,
    required this.refresh,
  });
  final String companyId;
  final void Function() refresh;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 15,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImages.assetsImagesEmptyState),
                Text(
                  "company_empty.your_company".tr(),
                  style: AppFontStyle.bold22,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          CustomPushButton(
            onTap: () {
              context.push(Routes.companySetupPage, extra: {
                "id": companyId,
              }).then((value) {
                if (value != null && value == true) {
                  refresh();
                }
              });
            },
            backgroundColor: AppColors.green53,
            child: Center(
              child: Text(
                "company_empty.add_setup".tr(),
                style: AppFontStyle.semiBold16,
              ),
            ),
          ),
          SizedBox(
            height: 75,
          )
        ],
      ),
    );
  }
}
