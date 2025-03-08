import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:workify/features/admin/auth/domain/repo/auth_repo.dart';
import 'package:workify/features/admin/auth/domain/use_cases/login_use_case.dart';
import 'package:workify/features/admin/auth/domain/use_cases/sign_up_use_case.dart';

final getIt = GetIt.instance;
Future<void> setUp() async {
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  //_____________________ AUTH-Admin ______________________//
  getIt.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(firebaseAuth: getIt.get<FirebaseAuth>()));
  getIt.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(authRepo: getIt.get<AuthRepo>()));
  getIt.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(authRepo: getIt.get<AuthRepo>()));
}
