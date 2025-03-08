import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:workify/features/admin/auth/data/models/manager_model.dart';
import 'package:workify/features/admin/auth/domain/use_cases/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());

  void changeObsecurePassowrd(bool value) {
    emit(ChangeObseucreState(value: !value));
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoadingLoginState());
    final result =
        await loginUseCase.call(ManagerModel(email: email, password: password));
    result.fold((failure) {
      emit(FailureLoginState(errMessage: failure.message));
    }, (userUid) {
      emit(SuccessLoginState(id: userUid));
    });
  }
}
