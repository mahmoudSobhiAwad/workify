part of 'login_emp_cubit.dart';

sealed class LoginEmpState {}

final class LoginEmpInitial extends LoginEmpState {}

final class LoadingLoginState extends LoginEmpState {}

final class SuccessLoadingState extends LoginEmpState {
  final EmployeeModel model;

  SuccessLoadingState({required this.model});
}

final class FailureLoginState extends LoginEmpState {
  final String errMessage;

  FailureLoginState({required this.errMessage});
}
