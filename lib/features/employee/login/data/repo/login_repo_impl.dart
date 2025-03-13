import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:workify/core/storage/cache_helper.dart';
import 'package:workify/core/utils/constants/app_strings.dart';
import 'package:workify/core/utils/constants/enums.dart';
import 'package:workify/features/admin/users/data/models/employee_model.dart';
import 'package:workify/features/employee/login/domain/repo/login_repo.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final FirebaseFirestore firestore;

  EmployeeRepositoryImpl(this.firestore);

  @override
  Future<Either<String, EmployeeModel>> login({
    required String companyId,
    required String userName,
    required String password,
  }) async {
    try {
      final docSnapshot = await firestore
          .collection("companies")
          .doc(companyId)
          .collection("employees")
          .doc(userName)
          .get();

      if (docSnapshot.exists && docSnapshot.data() != null) {
        final employee = EmployeeModel.fromJson(docSnapshot.data()!);
        if (employee.password == password) {
          await AppSharedPreferences.setString(
            value: jsonEncode({
              "role": UserRoleEnum.employee.name,
              "userName": employee.userName,
              "companyId": companyId,
            }),
            key: AppStrings.userModelKey,
          );
          return Right(employee);
        } else {
          return Left("Incorrect username or password");
        }
      } else {
        return Left("No user found");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
