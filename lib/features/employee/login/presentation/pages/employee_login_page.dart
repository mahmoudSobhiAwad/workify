import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workify/core/dependancy_injection/service_locator.dart';
import 'package:workify/core/routing/routes.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_images.dart';
import 'package:workify/features/admin/company/data/models/company_model.dart';
import 'package:workify/features/employee/login/domain/use_case.dart/login_use_case.dart';
import 'package:workify/features/employee/login/presentation/cubit/login_emp_cubit.dart';
import 'package:workify/shared/features/on_boarding/presentation/widgets/custom_push_button.dart';
import 'package:workify/shared/functions/custom_toaster.dart';
import 'package:workify/shared/widgets/custom_app_bar.dart';
import 'package:workify/shared/widgets/custom_text_form_field.dart';

class EmployeeLoginPage extends StatelessWidget {
  const EmployeeLoginPage({super.key, required this.companyModel});
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginEmpCubit>(
      create: (context) => LoginEmpCubit(
          companyModel: companyModel,
          loginUseCase: getIt.get<LoginEmployeeUseCase>()),
      child: Scaffold(
          appBar: CustomAppBar(title: ""),
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
                  LoginEmpBody(),
                ],
              ),
            ),
          ))),
    );
  }
}

class LoginEmpBody extends StatefulWidget {
  const LoginEmpBody({
    super.key,
  });

  @override
  State<LoginEmpBody> createState() => _LoginEmpBodyState();
}

class _LoginEmpBodyState extends State<LoginEmpBody> {
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  bool hiddenPassword = true;

  @override
  void dispose() {
    userNameController.dispose();
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
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "login.login".tr(),
                style: AppFontStyle.bold21,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              hintText: "login.email".tr(),
              controller: userNameController,
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your user name";
                }
                return null;
              },
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              controller: passwordController,
              hintText: "login.password".tr(),
              maxLine: 1,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your password";
                }

                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<LoginEmpCubit, LoginEmpState>(
              listener: (context, state) {
                if (state is SuccessLoadingState) {
                  context.go(Routes.basicPreviewEmployee);
                } else if (state is FailureLoginState) {
                  CustomToast(context: context, header: state.errMessage)
                      .showBottomToast();
                }
              },
              builder: (context, state) {
                return CustomPushButton(
                  isLoading: state is LoadingLoginState,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      context.read<LoginEmpCubit>().login(
                          userName: userNameController.text,
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
                        "login.log_in".tr(),
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
