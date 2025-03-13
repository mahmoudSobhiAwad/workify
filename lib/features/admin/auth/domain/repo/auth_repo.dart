import 'package:dartz/dartz.dart';
import 'package:workify/core/error/firebase_failures/failure.dart';
import 'package:workify/features/admin/auth/data/models/manager_model.dart';

abstract class AuthRepo {
  Future<Either<FirebaseFailure, String?>> signUp(ManagerModel model);
  Future<Either<FirebaseFailure, String?>> login(ManagerModel model);
}
