part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class ChangeObseucreState extends LoginState {
  final bool value;

  ChangeObseucreState({required this.value});
}

final class LoginActionStates extends LoginState {}

final class LoadingLoginState extends LoginActionStates {}

final class FailureLoginState extends LoginActionStates {
  final String errMessage;

  FailureLoginState({required this.errMessage});
}

final class SuccessLoginState extends LoginActionStates {
  final String? id;

  SuccessLoginState({required this.id});
}
