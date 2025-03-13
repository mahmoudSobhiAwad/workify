part of 'employee_cubit.dart';

sealed class EmployeeState {}

final class EmployeeInitial extends EmployeeState {}

// get employees state //

final class GetEmployeeStates extends EmployeeState {}

final class LoadingGetEmployeeStates extends GetEmployeeStates {}

final class SuccessGetEmployeeStates extends GetEmployeeStates {
  final List<EmployeeModel> employeesList;

  SuccessGetEmployeeStates({required this.employeesList});
}

final class FailureGetEmployeeStates extends GetEmployeeStates {
  final String errMessage;

  FailureGetEmployeeStates({required this.errMessage});
}

// update Employee state //

final class UpdateEmployeeStates extends EmployeeState {}

final class LoadingUpdateEmployeeStates extends UpdateEmployeeStates {}

final class SuccessUpdateEmployeeStates extends UpdateEmployeeStates {}

final class FailureUpdateEmployeeStates extends UpdateEmployeeStates {
  final String errMessage;

  FailureUpdateEmployeeStates({required this.errMessage});
}

final class DeleteEmployeeStates extends EmployeeState {}

final class LoadingDeleteEmployeeStates extends DeleteEmployeeStates {}

final class SuccessDeleteEmployeeStates extends DeleteEmployeeStates {}

final class FailureDeleteEmployeeStates extends DeleteEmployeeStates {
  final String errMessage;

  FailureDeleteEmployeeStates({required this.errMessage});
}
