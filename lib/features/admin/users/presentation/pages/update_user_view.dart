import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/shared/features/on_boarding/presentation/widgets/custom_push_button.dart';
import 'package:workify/shared/widgets/custom_app_bar.dart';
import 'package:workify/shared/widgets/custom_text_form_field.dart';

class UpdateUserView extends StatelessWidget {
  const UpdateUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Create User",
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Text(
                    "Account",
                    style: AppFontStyle.bold22,
                  ),
                  CustomTextFormField(
                    hintText: "User Name",
                  ),
                  CustomTextFormField(
                    hintText: "Password",
                    suffixWidget: IconButton(
                        onPressed: null,
                        icon: SvgPicture.asset(AppIcons.assetsIconsEyeClosed)),
                  ),
                  Text(
                    "Personal Info",
                    style: AppFontStyle.bold22,
                  ),
                  Row(
                    spacing: 24,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          hintText: "First Name",
                        ),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          hintText: "Last Name",
                        ),
                      ),
                    ],
                  ),
                  CustomTextFormField(
                    hintText: "Address",
                  ),
                  Row(
                    spacing: 24,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          hintText: "Email",
                        ),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          hintText: "Phone",
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Job Info",
                    style: AppFontStyle.bold22,
                  ),
                  CustomTextFormField(
                    hintText: "Job Title",
                  ),
                  Row(
                    spacing: 24,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          hintText: "Salary",
                        ),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          hintText: "Level",
                          suffixWidget: IconButton(
                              onPressed: null,
                              icon: SvgPicture.asset(
                                  AppIcons.assetsIconsArrowDownIcon)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          CustomPushButton(
            margin: EdgeInsets.all(16),
            backgroundColor: AppColors.green53,
            child: Center(
              child: Text(
                "Save",
                style: AppFontStyle.semiBold16,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
