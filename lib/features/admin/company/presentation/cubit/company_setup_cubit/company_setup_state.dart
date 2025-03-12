part of 'company_setup_cubit.dart';

sealed class CompanySetupState {}

final class CompanySetupInitial extends CompanySetupState {}

final class ChangePickedImageState extends CompanySetupState {
  final ImageTypeModel? imageTypeModel;

  ChangePickedImageState({this.imageTypeModel});
}

final class ChangeCompanyWorkPositionState extends CompanySetupState {
  final bool value;

  ChangeCompanyWorkPositionState({required this.value});
}

final class ChangeSelectedDayState extends CompanySetupState {}

final class ChangeCompanyLocationState extends CompanySetupState {
  final LatLng latLng;
  final String imageMap;

  ChangeCompanyLocationState({required this.latLng, required this.imageMap});
}

final class UpdateCompanyStates extends CompanySetupState {}

final class LoadingUpdateCompanyStates extends UpdateCompanyStates {}

final class SuccessUpdateCompanyStates extends UpdateCompanyStates {}

final class FailureUpdateCompanyStates extends UpdateCompanyStates {
  final String errMessage;

  FailureUpdateCompanyStates({required this.errMessage});
}
