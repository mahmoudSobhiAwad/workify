part of 'finger_print_cubit.dart';

sealed class FingerPrintState {}

final class FingerPrintInitial extends FingerPrintState {}

final class GetUserLocationState extends FingerPrintState {}

final class LoadingGetUserLocationState extends GetUserLocationState {}

final class FailureGetUserLocationState extends GetUserLocationState {
  final String errMessage;

  FailureGetUserLocationState({required this.errMessage});
}

final class SuccessGetUserLocationState extends GetUserLocationState {
  final Position position;

  SuccessGetUserLocationState({required this.position});
}

final class GetMovementOfDay extends FingerPrintState {}

final class LoadingGetMovementOfDay extends GetMovementOfDay {}

final class FailureGetMovementOfDay extends GetMovementOfDay {
  final String errMessage;

  FailureGetMovementOfDay({required this.errMessage});
}

final class SuccessGetMovementOfDay extends GetMovementOfDay {
  final MovementModel? model;

  SuccessGetMovementOfDay({this.model});
}

final class AddMovementState extends FingerPrintState {}

final class LoadingAddMovementState extends AddMovementState {}

final class FailureAddMovementState extends AddMovementState {
  final String errMessage;

  FailureAddMovementState({required this.errMessage});
}

final class SuccessAddMovementState extends AddMovementState {
  final MovementModel? movementModel;

  SuccessAddMovementState({required this.movementModel});
}
