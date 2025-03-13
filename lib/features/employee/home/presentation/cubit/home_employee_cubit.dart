import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:workify/core/storage/cache_helper.dart';
import 'package:workify/core/utils/constants/app_strings.dart';
import 'package:workify/features/admin/users/data/models/employee_model.dart';

part 'home_employee_state.dart';

class HomeEmployeeCubit extends Cubit<HomeEmployeeState> {
  HomeEmployeeCubit() : super(HomeEmployeeInitial());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String fullName =
      jsonDecode(AppSharedPreferences.getString(key: AppStrings.userModelKey)!)[
          'fullName'];
  final String userName =
      jsonDecode(AppSharedPreferences.getString(key: AppStrings.userModelKey)!)[
          'userName'];
  final String companyId =
      jsonDecode(AppSharedPreferences.getString(key: AppStrings.userModelKey)!)[
          'companyId'];
  Future<void> getEmployeeData() async {
    try {
      emit(LoadingGetAllEmployeeData());
      final result = await _firestore
          .collection("companies")
          .doc(companyId)
          .collection('employees')
          .doc(userName)
          .get();
      if (result.exists) {
        if (result.data() != null) {
          emit(SuccessGetAllEmployeeData(
              model: EmployeeModel.fromJson(result.data()!)));
        } else {
          emit(SuccessGetAllEmployeeData());
        }
      } else {
        emit(FailureGetAllEmployeeData(errMessage: "Not Found User"));
      }
    } catch (e) {
      emit(FailureGetAllEmployeeData(errMessage: e.toString()));
    }
  }
}
