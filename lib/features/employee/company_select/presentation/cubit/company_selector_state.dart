part of 'company_selector_cubit.dart';

sealed class CompanySelectorState {}

final class CompanySelectorInitial extends CompanySelectorState {}

final class ChangeSelectedCompanyState extends CompanySelectorState {
  final int value;

  ChangeSelectedCompanyState({required this.value});
}

final class LoadingGetAllCompainesState extends CompanySelectorState {}

final class SuccessGetAllCompainesState extends CompanySelectorState {
  final List<CompanyModel> compainesList;

  SuccessGetAllCompainesState({required this.compainesList});
}

final class FailureGetAllCompainesState extends CompanySelectorState {
  final String errMessage;

  FailureGetAllCompainesState({required this.errMessage});
}
