import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workify/core/routing/routes.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_images.dart';
import 'package:workify/shared/features/on_boarding/presentation/widgets/custom_push_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
              bottom: 0,
              child: SvgPicture.asset(
                AppImages.assetsImagesHomeBackGround,
                width: MediaQuery.sizeOf(context).width,
                fit: BoxFit.fill,
              )),
          Column(
            children: [
              SizedBox(
                height: 147,
              ),
              Expanded(
                  child: SvgPicture.asset(AppImages.assetsImagesSplashImage)),
              SizedBox(
                height: 100,
              ),
              Text(
                "Workify",
                style: AppFontStyle.bold30,
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                width: 180,
                child: Text(
                  "Together we can make a huge success",
                  textAlign: TextAlign.center,
                  style:
                      AppFontStyle.regular14.copyWith(color: AppColors.grayB2),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              CustomPushButton(
                onTap: () {
                  context.go(Routes.roleSelectPage);
                },
                margin: EdgeInsets.symmetric(horizontal: 38, vertical: 40),
                backgroundColor: AppColors.purblePrimary,
                child: Center(
                  child: Text(
                    "Get Started",
                    style: AppFontStyle.semiBold16,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
