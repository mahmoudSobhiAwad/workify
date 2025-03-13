part of 'company_cubit.dart';

sealed class CompanyState {}

final class CompanyInitial extends CompanyState {}

final class LoadCompanyState extends CompanyState {}

final class LoadingLoadCompanyState extends LoadCompanyState {}

final class FailureLoadCompanyState extends LoadCompanyState {
  final String errMessage;

  FailureLoadCompanyState({required this.errMessage});
}

final class SuccessLoadCompanyState extends LoadCompanyState {
  final CompanyModel? companyModel;

  SuccessLoadCompanyState({this.companyModel});
}
