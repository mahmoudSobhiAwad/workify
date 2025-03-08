import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:workify/core/error/firebase_failures/failure.dart';
import 'package:workify/features/admin/auth/data/models/manager_model.dart';

abstract class AuthRepo {
  Future<Either<FirebaseFailure, String?>> signUp(ManagerModel model);
  Future<Either<FirebaseFailure, String?>> login(ManagerModel model);
}

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuth firebaseAuth;

  AuthRepoImpl({required this.firebaseAuth});
  @override
  Future<Either<FirebaseFailure, String?>> signUp(ManagerModel model) async {
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
          email: model.email, password: model.password);
      return right(result.user?.uid);
    } on FirebaseAuthException catch (error) {
      return left(FirebaseFailure.fromAuthException(error));
    }
  }

  @override
  Future<Either<FirebaseFailure, String?>> login(ManagerModel model) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
          email: model.email, password: model.password);
      return right(result.user?.uid);
    } on FirebaseAuthException catch (error) {
      return left(FirebaseFailure.fromAuthException(error));
    }
  }
}
