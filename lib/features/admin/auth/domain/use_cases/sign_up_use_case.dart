import 'package:dartz/dartz.dart';
import 'package:workify/core/error/firebase_failures/failure.dart';
import 'package:workify/core/uses_cases/use_cases.dart';
import 'package:workify/features/admin/auth/data/models/manager_model.dart';
import 'package:workify/features/admin/auth/domain/repo/auth_repo.dart';

class SignUpUseCase extends UseCase<String?, ManagerModel> {
  final AuthRepo authRepo;
  SignUpUseCase({required this.authRepo});
  @override
  Future<Either<FirebaseFailure, String?>> call(ManagerModel params) async {
    return await authRepo.signUp(params);
  }
}
