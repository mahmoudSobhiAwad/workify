part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class ChangeObesecurePasswordState extends SignUpState {
  final bool value;

  ChangeObesecurePasswordState({required this.value});
}

final class ChangeConfirmObesecurePasswordState extends SignUpState {
  final bool value;

  ChangeConfirmObesecurePasswordState({required this.value});
}

final class SignUpActionStates extends SignUpState {}

final class LoadingSignUpStates extends SignUpActionStates {}

final class FailureSignUpStates extends SignUpActionStates {
  final String errMessage;

  FailureSignUpStates({required this.errMessage});
}

final class SuccessSignUpActionStates extends SignUpActionStates {
  final ManagerModel model;

  SuccessSignUpActionStates({required this.model});
}
