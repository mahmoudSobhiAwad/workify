import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:workify/features/admin/auth/data/models/manager_model.dart';
import 'package:workify/features/admin/auth/domain/use_cases/sign_up_use_case.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.signUpUseCase}) : super(SignUpInitial());
  final SignUpUseCase signUpUseCase;

  void changeObsecurePassowrd(bool value) {
    emit(ChangeObesecurePasswordState(value: !value));
  }

  void changeConfirmObsecurePassowrd(bool value) {
    emit(ChangeConfirmObesecurePasswordState(value: !value));
  }

  Future<void> signUp(ManagerModel managerModel) async {
    emit(LoadingSignUpStates());
    final result = await signUpUseCase.call(managerModel);
    result.fold((failure) {
      emit(FailureSignUpStates(errMessage: failure.message));
    }, (token) {
      managerModel.id = token;
      emit(SuccessSignUpActionStates(model: managerModel));
    });
  }
}
