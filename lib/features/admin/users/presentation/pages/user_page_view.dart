import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/features/admin/users/presentation/widgets/custom_user_item.dart';
import 'package:workify/shared/features/on_boarding/presentation/widgets/custom_push_button.dart';
import 'package:workify/shared/widgets/custom_text_form_field.dart';

class UserPageView extends StatelessWidget {
  const UserPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 18,
        children: [
          Text(
            "Employees",
            style: AppFontStyle.bold22,
          ),
          Row(
            spacing: 20,
            children: [
              Expanded(
                  child: CustomTextFormField(
                fillColor: AppColors.whiteWithOpacity10,
                borderRadius: 4,
                prefixWidget: SvgPicture.asset(
                  AppIcons.assetsIconsSearchIcon,
                  fit: BoxFit.scaleDown,
                ),
                hintText: "Search",
              )),
              CustomPushButton(
                onTap: () {},
                borderRadius: 4,
                padding: EdgeInsets.all(12),
                height: 43,
                backgroundColor: AppColors.green53,
                child: Row(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: 18,
                      color: AppColors.whiteff,
                    ),
                    Text(
                      "Add New",
                      style: AppFontStyle.regular14,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.whiteWithOpacity10,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Row(
              // spacing: 10,
              children: [
                Expanded(
                    flex: 4,
                    child: Text(
                      "Name",
                      style: AppFontStyle.medium12,
                    )),
                Expanded(
                    flex: 4,
                    child: Text(
                      "Role",
                      style: AppFontStyle.medium12,
                    )),
                Expanded(
                    flex: 3,
                    child: Text(
                      "Level",
                      style: AppFontStyle.medium12,
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      "Actions",
                      style: AppFontStyle.medium12,
                    )),
              ],
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CustomUserItem();
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 16,
                    );
                  },
                  itemCount: 8)),
        ],
      ),
    );
  }
}
