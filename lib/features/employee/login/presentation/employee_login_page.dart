import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workify/core/routing/routes.dart';

import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/theme/app_font_stlyles.dart';
import '../../../../core/utils/theme/app_icons.dart';
import '../../../../core/utils/theme/app_images.dart';
import '../../../../shared/features/on_boarding/presentation/widgets/custom_push_button.dart';

class EmployeeLoginPage extends StatefulWidget {
  const EmployeeLoginPage({super.key});

  @override
  State<EmployeeLoginPage> createState() => _EmployeeLoginPageState();
}

class _EmployeeLoginPageState extends State<EmployeeLoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool hiddenPassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Form(
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
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade500, fontSize: 16),
                        filled: true,
                        fillColor: AppColors.black50,
                        errorStyle: TextStyle(color: AppColors.red35),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.purblePrimary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      ),
                      keyboardType: TextInputType.emailAddress,
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
                    TextFormField(
                      controller: passwordController,
                      obscureText: hiddenPassword,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade500, fontSize: 16),
                        filled: true,
                        fillColor: AppColors.black50,
                        errorStyle: TextStyle(color: AppColors.red35),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: IconButton(
                              onPressed: () {
                                togglePassword();
                              },
                              icon: SvgPicture.asset(
                                  AppIcons.assetsIconsEyeClosed)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.purblePrimary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomPushButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context.go(Routes.basicPreviewEmployee);
                        } else {
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all the fields")));
                        }
                      },
                      margin:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
                    )
                  ],
                )),
          ],
        ),
      ),
    )));
  }

  togglePassword() {
    hiddenPassword = !hiddenPassword;
    setState(() {});
  }

}
