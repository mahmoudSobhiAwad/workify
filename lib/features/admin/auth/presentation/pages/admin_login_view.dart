import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workify/core/dependancy_injection/service_locator.dart';
import 'package:workify/core/routing/routes.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_images.dart';
import 'package:workify/features/admin/auth/domain/use_cases/login_use_case.dart';
import 'package:workify/features/admin/auth/presentation/cubit/login/login_cubit.dart';
import 'package:workify/features/admin/auth/presentation/widgets/login_body.dart';

class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(loginUseCase: getIt.get<LoginUseCase>()),
      child: Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            SvgPicture.asset(AppImages.assetsImagesAppLogo),
            Text(
              "We make it Easy For You To manage your company",
              textAlign: TextAlign.center,
              style: AppFontStyle.bold16,
            ),
            SizedBox(
              height: 50,
            ),
            LoginBody(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Need Account?"),
                TextButton(
                  onPressed: () => context.push(Routes.adminSignUp),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: AppColors.purblePrimary),
                  ),
                )
              ],
            )
          ],
        ),
      ))),
    );
  }
}
