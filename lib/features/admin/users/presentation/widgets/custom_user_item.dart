import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workify/core/routing/routes.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/features/admin/users/data/models/employee_model.dart';
import 'package:workify/features/admin/users/presentation/cubit/employee_cubit.dart';
import 'package:workify/shared/functions/custom_toaster.dart';
import 'package:workify/shared/widgets/custom_two_option_dialog.dart';
import 'package:workify/shared/widgets/dialog_helper_option.dart';

class CustomUserItem extends StatelessWidget {
  const CustomUserItem({
    super.key,
    required this.employeeModel,
  });
  final EmployeeModel employeeModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.whiteWithOpacity10,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.grayE0,
          radius: 40,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(AppIcons.assetsIconsProfileIcon),
          ),
        ),
        title: Text(
          "${employeeModel.firstName} ${employeeModel.lastName} ",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppFontStyle.medium16.copyWith(color: Colors.white),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    employeeModel.jobTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFontStyle.medium14.copyWith(color: Colors.white),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: AppColors.green53,
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Text(
                      employeeModel.jobLevel,
                      style: AppFontStyle.regular12
                          .copyWith(color: AppColors.whiteff),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
                onTapDown: (details) {
                  DialogHelper.showCustomDialog(
                      firstOptionFunction: () {
                        context.push(Routes.updateUser, extra: {
                          "cubit": context.read<EmployeeCubit>(),
                          "model": employeeModel,
                        });
                      },
                      secondOptionFunction: () {
                        showDialog(
                            context: context,
                            builder: (childContext) =>
                                BlocConsumer<EmployeeCubit, EmployeeState>(
                                  bloc: context.read<EmployeeCubit>(),
                                  builder: (blocContext, state) {
                                    return CustomTwoOptionDialog(
                                        isLoading: state
                                            is LoadingDeleteEmployeeStates,
                                        backGroundColor: AppColors.red35,
                                        title:
                                            "Are You Sure To Delete This Employee",
                                        buttonTitle: "Delete",
                                        onTap: () {
                                          context
                                              .read<EmployeeCubit>()
                                              .deleteEmployee(
                                                  employeeModel.userName);
                                        });
                                  },
                                  listener: (listenerContext, state) {
                                    if (state is SuccessDeleteEmployeeStates) {
                                      context.pop(true);
                                    } else if (state
                                        is FailureDeleteEmployeeStates) {
                                      CustomToast(
                                              context: context,
                                              header: state.errMessage)
                                          .showBottomToast();
                                      if (context.mounted) {
                                        context.pop();
                                      }
                                    }
                                  },
                                )).then((value) {
                          if (value != null &&
                              value == true &&
                              context.mounted) {
                            context.read<EmployeeCubit>().getAllUsers();
                          }
                        });
                      },
                      firstOptionTitle: 'Edit',
                      secondOptionTitle: "Delete",
                      rightAligned: true,
                      secondOptionColor: AppColors.red35,
                      firstOptionColor: AppColors.whiteff,
                      firstOptionIconColor: AppColors.whiteff,
                      secondOptionIconColor: AppColors.red35,
                      context: context,
                      details: details);
                },
                child: SvgPicture.asset(AppIcons.assetsIconsThreeDotIcon)),
          ],
        ),
      ),
    );
  }
}
