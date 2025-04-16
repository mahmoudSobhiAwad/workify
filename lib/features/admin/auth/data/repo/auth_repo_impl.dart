import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:workify/core/error/firebase_failures/failure.dart';
import 'package:workify/core/storage/cache_helper.dart';
import 'package:workify/core/utils/constants/app_strings.dart';
import 'package:workify/core/utils/constants/enums.dart';
import 'package:workify/features/admin/auth/data/models/manager_model.dart';
import 'package:workify/features/admin/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuth firebaseAuth;

  AuthRepoImpl({required this.firebaseAuth});
  @override
  Future<Either<FirebaseFailure, String?>> signUp(ManagerModel model) async {
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
          email: model.email, password: model.password);
      await AppSharedPreferences.setString(
          value: jsonEncode({
            "role": UserRoleEnum.admin.name,
            "id": result.user?.uid,
          }),
          key: AppStrings.userModelKey);
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
      await AppSharedPreferences.setString(
          value: jsonEncode({
            "role": UserRoleEnum.admin.name,
            "id": result.user?.uid,
          }),
          key: AppStrings.userModelKey);
      return right(result.user?.uid);
    } on FirebaseAuthException catch (error) {
      return left(FirebaseFailure.fromAuthException(error));
    }
  }
}
