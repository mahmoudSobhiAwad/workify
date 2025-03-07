import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workify/core/routing/routes.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_images.dart';
import 'package:workify/shared/features/on_boarding/presentation/widgets/custom_push_button.dart';

class CompanyPageView extends StatelessWidget {
  const CompanyPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ComapnyEmptyStateView();
  }
}

class ComapnyEmptyStateView extends StatelessWidget {
  const ComapnyEmptyStateView({
    super.key,
  });

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
                  "Your Company hasn’t Set Yet, please add the required Features",
                  style: AppFontStyle.bold22,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          CustomPushButton(
            onTap: () {
              context.push(Routes.companySetupPage);
            },
            backgroundColor: AppColors.green53,
            child: Center(
              child: Text(
                "Add Setup",
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
