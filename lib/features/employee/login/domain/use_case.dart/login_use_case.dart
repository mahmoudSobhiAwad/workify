import 'package:dartz/dartz.dart';
import 'package:workify/features/admin/users/data/models/employee_model.dart';
import 'package:workify/features/employee/login/domain/repo/login_repo.dart';

class LoginEmployeeUseCase {
  final EmployeeRepository repository;

  LoginEmployeeUseCase(this.repository);

  Future<Either<String, EmployeeModel>> call({
    required String companyId,
    required String userName,
    required String password,
  }) async {
    return await repository.login(
      companyId: companyId,
      userName: userName,
      password: password,
    );
  }
}
