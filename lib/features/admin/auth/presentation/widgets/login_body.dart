import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';
import 'package:workify/core/constants/admin_home_nav_bar_list.dart';
import 'package:workify/core/routing/routes.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/features/admin/auth/presentation/cubit/login/login_cubit.dart';
import 'package:workify/features/admin/company/presentation/pages/company_page_view.dart';
import 'package:workify/features/admin/home/presentation/pages/admin_home.dart';
import 'package:workify/features/admin/users/presentation/pages/user_page_view.dart';
import 'package:workify/shared/features/on_boarding/presentation/widgets/custom_push_button.dart';
import 'package:workify/shared/features/settings/presentation/pages/settings_view.dart';
import 'package:workify/shared/functions/custom_toaster.dart';
import 'package:workify/shared/widgets/custom_text_form_field.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPassVisible = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Login",
                style: AppFontStyle.bold21,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: emailController,
              hintText: "Email",
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email";
                }
                return null;
              },
            ),
            SizedBox(
              height: 15,
            ),
            BlocBuilder<LoginCubit, LoginState>(
              buildWhen: (prev, curr) {
                return curr is ChangeObseucreState;
              },
              builder: (context, state) {
                if (state is ChangeObseucreState) {
                  isPassVisible = state.value;
                }
                return CustomTextFormField(
                  controller: passwordController,
                  isObeseureText: isPassVisible,
                  maxLine: 1,
                  hintText: "Password",
                  suffixWidget: IconButton(
                      onPressed: () {
                        context
                            .read<LoginCubit>()
                            .changeObsecurePassowrd(isPassVisible);
                      },
                      icon: SvgPicture.asset(AppIcons.assetsIconsEyeClosed)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is FailureLoginState) {
                  CustomToast(
                          context: context,
                          type: ToastificationType.error,
                          header: "Auth Failed",
                          description: state.errMessage)
                      .showBottomToast();
                } else if (state is SuccessLoginState) {
                  context.go(Routes.basicPreview, extra: {
                    "pages": [
                      AdminHomePage(),
                      UserPageView(),
                      CompanyPageView(),
                      SettingView(),
                    ],
                    "bottomNavList": adminHomeNavBarList,
                  });
                }
              },
              buildWhen: (prev, curr) {
                return curr is LoginActionStates;
              },
              builder: (context, state) {
                return CustomPushButton(
                  isLoading: state is LoadingLoginState,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      context.read<LoginCubit>().login(
                          email: emailController.text,
                          password: passwordController.text);
                    }
                  },
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  backgroundColor: AppColors.purblePrimary,
                  child: Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Login",
                        style: AppFontStyle.semiBold16,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ));
  }
}
