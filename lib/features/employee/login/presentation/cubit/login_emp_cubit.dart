import 'package:bloc/bloc.dart';

import 'package:workify/features/admin/company/data/models/company_model.dart';
import 'package:workify/features/admin/users/data/models/employee_model.dart';
import 'package:workify/features/employee/login/data/model/login_model.dart';
import 'package:workify/features/employee/login/domain/use_case.dart/login_use_case.dart';

part 'login_emp_state.dart';

class LoginEmpCubit extends Cubit<LoginEmpState> {
  LoginEmpCubit({required this.companyModel, required this.loginUseCase})
      : super(LoginEmpInitial());
  final CompanyModel companyModel;
  final LoginEmployeeUseCase loginUseCase;

  Future<void> login(
      {required String userName, required String password}) async {
    emit(LoadingLoginState());

    final result = await loginUseCase.call(LogingParamModel(
        companyId: companyModel.companyId,
        userName: userName,
        password: password,
        companyLocation: companyModel.latLng,
        ));

    result.fold(
      (failure) => emit(FailureLoginState(errMessage: failure.message)),
      (employee) async {
        emit(SuccessLoadingState(model: employee));
      },
    );
  }
}
