import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workify/core/routing/routes.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/features/admin/users/presentation/cubit/employee_cubit.dart';
import 'package:workify/features/admin/users/presentation/widgets/employess_list.dart';
import 'package:workify/shared/features/on_boarding/presentation/widgets/custom_push_button.dart';
import 'package:workify/shared/widgets/custom_text_form_field.dart';

class UserPageView extends StatelessWidget {
  const UserPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeCubit()..getAllUsers(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<EmployeeCubit, EmployeeState>(
          buildWhen: (prev, curr) {
            return curr is GetEmployeeStates;
          },
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<EmployeeCubit>().getAllUsers();
              },
              child: CustomScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Text(
                      "emp_list.employees".tr(),
                      style: AppFontStyle.bold22,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: BlocBuilder<EmployeeCubit, EmployeeState>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                fillColor: AppColors.whiteWithOpacity10,
                                borderRadius: 4,
                                contentPadding: EdgeInsetsDirectional.all(12),
                                prefixWidget: SvgPicture.asset(
                                  AppIcons.assetsIconsSearchIcon,
                                  fit: BoxFit.scaleDown,
                                ),
                                hintText: "emp_list.search".tr(),
                              ),
                            ),
                            const SizedBox(width: 20),
                            CustomPushButton(
                              onTap: () {
                                context.push(Routes.updateUser, extra: {
                                  'cubit': context.read<EmployeeCubit>()
                                }).then((value) {
                                  if (value != null &&
                                      value == true &&
                                      context.mounted) {
                                    context.read<EmployeeCubit>().getAllUsers();
                                  }
                                });
                              },
                              borderRadius: 4,
                              padding: EdgeInsets.all(12),
                              height: 43,
                              backgroundColor: AppColors.green38,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 18,
                                    color: AppColors.whiteff,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "emp_list.add".tr(),
                                    style: AppFontStyle.regular14,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverFillRemaining(
                    child: EmployeesListView(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
