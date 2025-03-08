import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workify/core/routing/routes.dart';
import 'package:workify/features/admin/company/presentation/pages/company_page_view.dart';
import 'package:workify/features/admin/home/presentation/pages/admin_home.dart';
import 'package:workify/features/admin/signup/presenataion/signup_page.dart';
import 'package:workify/features/admin/users/presentation/pages/user_page_view.dart';
import 'package:workify/shared/features/basic_preview/data/models/bottom_nav_bar_model.dart';

import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/theme/app_font_stlyles.dart';
import '../../../../core/utils/theme/app_icons.dart';
import '../../../../core/utils/theme/app_images.dart';
import '../../../../shared/features/on_boarding/presentation/widgets/custom_push_button.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
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
                Text("We make it Easy For You To manage your company"),
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
                              borderRadius: BorderRadius.circular(10)
                            ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                          //just for design now
                          _navigateToHome();
                          if (formKey.currentState!.validate()) {
                            _navigateToHome();
                          } else {
                            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all the fields")));
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
                      )
                    ],
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Need Account?  "),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdminSignupPage()));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: AppColors.purblePrimary),
                      )
                    )
                  ],
                )
              ],
            ),
          ),
        )
      )
    );
  }

  togglePassword() {
    hiddenPassword = !hiddenPassword;
    setState(() {});
  }

  _navigateToHome() {
    context.go(Routes.basicPreview, extra: {
      "pages": [
        AdminHomePage(),
        UserPageView(),
        CompanyPageView(),
        SizedBox(),
      ],
      "bottomNavList": [
        BottomNavBarModel(
          activeItemPath: AppIcons.assetsIconsHomeSelected,
          nonActiveItemPath: AppIcons.assetsIconsHomeNotSelected
        ),
        BottomNavBarModel(
          activeItemPath: AppIcons.assetsIconsUsersSelected,
          nonActiveItemPath: AppIcons.assetsIconsUsersNotSelected
        ),
        BottomNavBarModel(
          activeItemPath: AppIcons.assetsIconsCompanySelected,
          nonActiveItemPath: AppIcons.assetsIconsCompanyNotSelected
        ),
        BottomNavBarModel(
          activeItemPath: AppIcons.assetsIconsSelectedSetting,
          nonActiveItemPath: AppIcons.assetsIconsSettingNotSelected
        ),
      ],
    });
  }
}