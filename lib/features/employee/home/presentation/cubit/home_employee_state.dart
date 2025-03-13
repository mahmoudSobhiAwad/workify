part of 'home_employee_cubit.dart';

@immutable
sealed class HomeEmployeeState {}

final class HomeEmployeeInitial extends HomeEmployeeState {}

final class LoadingGetAllEmployeeData extends HomeEmployeeState {}

final class SuccessGetAllEmployeeData extends HomeEmployeeState {
  final EmployeeModel? model;

  SuccessGetAllEmployeeData({this.model});
}

final class FailureGetAllEmployeeData extends HomeEmployeeState {
  final String errMessage;

  FailureGetAllEmployeeData({required this.errMessage});
}
