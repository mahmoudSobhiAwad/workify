import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workify/core/routing/routes.dart';
import 'package:workify/core/utils/theme/app_colors.dart';
import 'package:workify/core/utils/theme/app_font_stlyles.dart';
import 'package:workify/core/utils/theme/app_icons.dart';
import 'package:workify/features/admin/users/data/models/notification_model.dart';
import 'package:workify/features/admin/users/presentation/cubit/employee_cubit.dart';
import 'package:workify/features/admin/users/presentation/widgets/custom_user_item.dart';
import 'package:workify/shared/features/on_boarding/presentation/widgets/custom_push_button.dart';
import 'package:workify/shared/widgets/custom_text_form_field.dart';
import 'package:workify/shared/widgets/shimmer_loading.dart';

class UserPageView extends StatelessWidget {
  const UserPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeCubit()..getAllUsers(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 18,
          children: [
            Text(
              "Employees",
              style: AppFontStyle.bold22,
            ),
            BlocBuilder<EmployeeCubit, EmployeeState>(
              builder: (context, state) {
                return Row(
                  spacing: 20,
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
                      hintText: "Search",
                    )),
                    CustomPushButton(
                      onTap: () {
                        context.push(Routes.updateUser,
                            extra: {'cubit': context.read<EmployeeCubit>()});
                      },
                      borderRadius: 4,
                      padding: EdgeInsets.all(12),
                      height: 43,
                      backgroundColor: AppColors.green38,
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
                );
              },
            ),
            EmployeesListView(),
          ],
        ),
      ),
    );
  }
}

class EmployeesListView extends StatefulWidget {
  const EmployeesListView({
    super.key,
  });

  @override
  State<EmployeesListView> createState() => _EmployeesListViewState();
}

class _EmployeesListViewState extends State<EmployeesListView> {
  List<EmployeeModel> employeeList = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeCubit, EmployeeState>(
      buildWhen: (prev, curr) {
        return curr is GetEmployeeStates;
      },
      builder: (context, state) {
        if (state is LoadingGetEmployeeStates) {
          return Expanded(child: CustomShimmerList());
        } else if (state is FailureGetEmployeeStates) {
          return Center(
              child: Text(
            state.errMessage,
            style: AppFontStyle.medium16,
          ));
        } else if (state is SuccessGetEmployeeStates) {
          employeeList = state.employeesList;
        }
        return employeeList.isEmpty
            ? Center(
                child: Text("U don't Have Employees Yet"),
              )
            : Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CustomUserItem(
                        employeeModel: employeeList[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 16,
                      );
                    },
                    itemCount: employeeList.length));
      },
    );
  }
}
