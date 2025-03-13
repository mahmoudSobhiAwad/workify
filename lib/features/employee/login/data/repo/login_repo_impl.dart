import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:workify/core/error/firebase_failures/failure.dart';
import 'package:workify/core/storage/cache_helper.dart';
import 'package:workify/core/utils/constants/app_strings.dart';
import 'package:workify/core/utils/constants/enums.dart';
import 'package:workify/features/admin/users/data/models/employee_model.dart';
import 'package:workify/features/employee/login/data/model/login_model.dart';
import 'package:workify/features/employee/login/domain/repo/login_repo.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final FirebaseFirestore firestore;

  EmployeeRepositoryImpl(this.firestore);

  @override
  Future<Either<FirebaseFailure, EmployeeModel>> login({
    required LogingParamModel param,
  }) async {
    try {
      final docSnapshot = await firestore
          .collection("companies")
          .doc(param.companyId)
          .collection("employees")
          .doc(param.userName)
          .get();

      if (docSnapshot.exists && docSnapshot.data() != null) {
        final employee = EmployeeModel.fromJson(docSnapshot.data()!);
        if (employee.password == param.password) {
          await AppSharedPreferences.setString(
            value: jsonEncode({
              "role": UserRoleEnum.employee.name,
              "userName": employee.userName,
              "companyId": param.companyId,
              "fullName": '${employee.firstName} ${employee.lastName}',
              if (param.companyLocation != null)
                "companyLocation": {
                  'lat': param.companyLocation!.latitude,
                  "long": param.companyLocation!.longitude,
                }
            }),
            key: AppStrings.userModelKey,
          );
          return Right(employee);
        } else {
          return Left(FirebaseFailure("Incorrect username or password"));
        }
      } else {
        return Left(FirebaseFailure("No user found"));
      }
    } catch (e) {
      return Left(FirebaseFailure(e.toString()));
    }
  }
}
