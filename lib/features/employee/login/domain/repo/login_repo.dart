import 'package:dartz/dartz.dart';
import 'package:workify/features/admin/users/data/models/employee_model.dart';

abstract class EmployeeRepository {
  Future<Either<String, EmployeeModel>> login({
    required String companyId,
    required String userName,
    required String password,
  });
}
