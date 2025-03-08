import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workify/core/dependancy_injection/service_locator.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_images.dart';
import 'package:workify/features/admin/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:workify/features/admin/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:workify/features/admin/auth/presentation/widgets/sign_up_body.dart';

class AdminSignupPage extends StatelessWidget {
  const AdminSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (BuildContext context) =>
          SignUpCubit(signUpUseCase: getIt.get<SignUpUseCase>()),
      child: Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              SvgPicture.asset(AppImages.assetsImagesAppLogo),
              SizedBox(
                height: 50,
              ),
              SignUpBody(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Have Account? "),
                  TextButton(
                      onPressed: () => context.pop(),
                      child: Text("Login",
                          style: AppFontStyle.semiBold16
                              .copyWith(color: AppColors.purblePrimary)))
                ],
              )
            ],
          ),
        ),
      ))),
    );
  }
}
