import 'package:dartz/dartz.dart';
import 'package:workify/core/error/firebase_failures/failure.dart';
import 'package:workify/features/admin/users/data/models/employee_model.dart';
import 'package:workify/features/employee/login/data/model/login_model.dart';

abstract class EmployeeRepository {
  Future<Either<FirebaseFailure, EmployeeModel>> login(
      {required LogingParamModel param});
}
