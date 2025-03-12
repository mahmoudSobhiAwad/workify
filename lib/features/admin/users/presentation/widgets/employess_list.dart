import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workify/features/admin/users/data/models/notification_model.dart';
import 'package:workify/features/admin/users/presentation/cubit/employee_cubit.dart';
import 'package:workify/features/admin/users/presentation/widgets/custom_user_item.dart';
import 'package:workify/shared/widgets/empty_widget.dart';
import 'package:workify/shared/widgets/error_widget.dart';
import 'package:workify/shared/widgets/shimmer_loading.dart';

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
          return CustomShimmerList();
        } else if (state is FailureGetEmployeeStates) {
          return ErrorWidgetState(
            errMessage: state.errMessage,
          );
        } else if (state is SuccessGetEmployeeStates) {
          employeeList = state.employeesList;
        }
        return employeeList.isEmpty
            ? EmptyWidgetState()
            : ListView.separated(
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
                itemCount: employeeList.length);
      },
    );
  }
}
