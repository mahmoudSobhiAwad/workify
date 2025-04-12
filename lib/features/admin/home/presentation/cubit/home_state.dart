part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class LoadMovements extends HomeState {}

final class LoadingLoadMovements extends LoadMovements {}

final class SuccessLoadMovements extends LoadMovements {
  final List<MovementModel> movements;

  SuccessLoadMovements({required this.movements});
}

final class FailureLoadMovements extends LoadMovements {
  final String errMessage;

  FailureLoadMovements({required this.errMessage});
}
