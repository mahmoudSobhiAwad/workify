import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';
import 'package:workify/core/dependancy_injection/service_locator.dart';
import 'package:workify/core/routing/routes.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/core/utils/theme/app_images.dart';
import 'package:workify/features/admin/auth/data/models/manager_model.dart';
import 'package:workify/features/admin/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:workify/features/admin/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:workify/features/admin/company/presentation/pages/company_page_view.dart';
import 'package:workify/features/admin/home/presentation/pages/admin_home.dart';
import 'package:workify/features/admin/users/presentation/pages/user_page_view.dart';
import 'package:workify/shared/features/basic_preview/data/models/bottom_nav_bar_model.dart';
import 'package:workify/shared/features/on_boarding/presentation/widgets/custom_push_button.dart';
import 'package:workify/shared/functions/custom_toaster.dart';
import 'package:workify/shared/widgets/custom_text_form_field.dart';

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

class SignUpBody extends StatefulWidget {
  const SignUpBody({
    super.key,
  });

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPassVisible = true;
  final confirmPassController = TextEditingController();
  bool isConfirmPassVisible = true;

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
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
                "Sign Up",
                style: AppFontStyle.bold21,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: emailController,
              hintText: "Email",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: firstNameController,
                    hintText: "First Name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your first name";
                      }
                      return null;
                    },
                  ),
                ),
                Expanded(
                  child: CustomTextFormField(
                    hintText: "Last Name",
                    controller: lastNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your last name";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            BlocBuilder<SignUpCubit, SignUpState>(
              buildWhen: (prev, curr) {
                return curr is ChangeObesecurePasswordState;
              },
              builder: (context, state) {
                if (state is ChangeObesecurePasswordState) {
                  isPassVisible = state.value;
                }
                return CustomTextFormField(
                  maxLine: 1,
                  suffixWidget: IconButton(
                      onPressed: () {
                        context
                            .read<SignUpCubit>()
                            .changeObsecurePassowrd(isPassVisible);
                      },
                      icon: SvgPicture.asset(AppIcons.assetsIconsEyeClosed)),
                  controller: passwordController,
                  isObeseureText: isPassVisible,
                  hintText: "Password",
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
              height: 15,
            ),
            BlocBuilder<SignUpCubit, SignUpState>(
              buildWhen: (prev, curr) {
                return curr is ChangeConfirmObesecurePasswordState;
              },
              builder: (context, state) {
                if (state is ChangeConfirmObesecurePasswordState) {
                  isConfirmPassVisible = state.value;
                }
                return CustomTextFormField(
                  maxLine: 1,
                  suffixWidget: IconButton(
                      onPressed: () {
                        context
                            .read<SignUpCubit>()
                            .changeConfirmObsecurePassowrd(
                                isConfirmPassVisible);
                      },
                      icon: SvgPicture.asset(AppIcons.assetsIconsEyeClosed)),
                  controller: confirmPassController,
                  isObeseureText: isConfirmPassVisible,
                  hintText: "Confirm Password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    } else if (passwordController.text !=
                        confirmPassController.text) {
                      return 'Passwords must be identical';
                    }
                    return null;
                  },
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<SignUpCubit, SignUpState>(
              listener: (context, state) {
                if (state is FailureSignUpStates) {
                  CustomToast(
                      context: context,
                      header: "Auth Failed",
                      type: ToastificationType.error,
                      description: state.errMessage).showBottomToast();
                } else if (state is SuccessSignUpActionStates) {
                  CustomToast(
                    context: context,
                    header: "Account Created Successfully ",
                    type: ToastificationType.success,
                  ).showBottomToast();
                }
              },
              buildWhen: (prev, curr) {
                return curr is SignUpActionStates;
              },
              builder: (context, state) {
                return CustomPushButton(
                  isLoading: state is LoadingSignUpStates,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      context.read<SignUpCubit>().signUp(ManagerModel(
                          email: emailController.text,
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          password: passwordController.text));
                    }
                  },
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  backgroundColor: AppColors.purblePrimary,
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: AppFontStyle.semiBold16,
                      textAlign: TextAlign.start,
                    ),
                  ),
                );
              },
            )
          ],
        ));
  }
}
