import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:workify/features/admin/auth/data/repo/auth_repo_impl.dart';
import 'package:workify/features/admin/auth/domain/repo/auth_repo.dart';
import 'package:workify/features/admin/auth/domain/use_cases/login_use_case.dart';
import 'package:workify/features/admin/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:workify/features/employee/login/data/repo/login_repo_impl.dart';
import 'package:workify/features/employee/login/domain/repo/login_repo.dart';
import 'package:workify/features/employee/login/domain/use_case.dart/login_use_case.dart';

final getIt = GetIt.instance;
Future<void> setUp() async {
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  //_____________________ AUTH-Admin ______________________//
  getIt.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(firebaseAuth: getIt.get<FirebaseAuth>()));
  getIt.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(authRepo: getIt.get<AuthRepo>()));
  getIt.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(authRepo: getIt.get<AuthRepo>()));

  //----------------------AUTH-Employee=====================//
  getIt.registerLazySingleton<EmployeeRepository>(
      () => EmployeeRepositoryImpl(getIt.get<FirebaseFirestore>()));
  getIt.registerLazySingleton<LoginEmployeeUseCase>(
      () => LoginEmployeeUseCase(getIt.get<EmployeeRepository>()));
}
