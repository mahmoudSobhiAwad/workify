import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:workify/core/error/firebase_failures/failure.dart';
import 'package:workify/core/uses_cases/use_cases.dart';
import 'package:workify/features/admin/users/data/models/employee_model.dart';
import 'package:workify/features/employee/login/data/model/login_model.dart';
import 'package:workify/features/employee/login/domain/repo/login_repo.dart';

class LoginEmployeeUseCase extends UseCase<EmployeeModel, LogingParamModel> {
  final EmployeeRepository repository;
  LoginEmployeeUseCase({required this.repository});

  @override
  Future<Either<FirebaseFailure, EmployeeModel>> call(
      LogingParamModel params) async {
    return await repository.login(
      param: params,
    );
  }
}
