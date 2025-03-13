import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workify/core/storage/cache_helper.dart';
import 'package:workify/core/utils/constants/app_strings.dart';
import 'package:workify/features/admin/users/data/models/employee_model.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(EmployeeInitial());
  final String id = jsonDecode(AppSharedPreferences.sharedPreferences
          .getString(AppStrings.userModelKey) ??
      "")['id'];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createNewUser(EmployeeModel model) async {
    emit(LoadingUpdateEmployeeStates());
    final result = await checIfExistFirst(model.userName);
    if (result != null && result == true) {
      try {
        await _firestore
            .collection("companies")
            .doc(id)
            .collection("employees")
            .doc(model.userName)
            .set(model.toJson());
        emit(SuccessUpdateEmployeeStates());
      } catch (e) {
        emit(FailureUpdateEmployeeStates(errMessage: e.toString()));
      }
    } else {
      emit(FailureUpdateEmployeeStates(
          errMessage: "This User Name is created Before"));
    }
  }

  Future<void> getAllUsers() async {
    emit(LoadingGetEmployeeStates());
    try {
      final result = await _firestore
          .collection("companies")
          .doc(id)
          .collection("employees")
          .get();
      final List<EmployeeModel> employees = [];
      for (var item in result.docs) {
        employees.add(EmployeeModel.fromJson(item.data()));
      }
      emit(SuccessGetEmployeeStates(employeesList: employees));
    } on FirebaseException catch (e) {
      emit(FailureGetEmployeeStates(errMessage: e.toString()));
    }
  }

  Future<bool?> checIfExistFirst(String userName) async {
    try {
      DocumentReference docRef = _firestore
          .collection("companies")
          .doc(id)
          .collection("employees")
          .doc(userName);
      DocumentSnapshot docSnapshot = await docRef.get();
      if (docSnapshot.exists) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteEmployee(String userName) async {
    try {
      emit(LoadingDeleteEmployeeStates());
      await _firestore
          .collection("companies")
          .doc(id)
          .collection("employees")
          .doc(userName)
          .delete();
      emit(SuccessDeleteEmployeeStates());
    } catch (e) {
      emit(FailureDeleteEmployeeStates(errMessage: e.toString()));
    }
  }

  Future<void> updateUser(EmployeeModel model) async {
    emit(LoadingUpdateEmployeeStates());

    try {
      await _firestore
          .collection("companies")
          .doc(id)
          .collection("employees")
          .doc(model.userName)
          .update(model.toJson());
      emit(SuccessUpdateEmployeeStates());
    } catch (e) {
      emit(FailureUpdateEmployeeStates(errMessage: e.toString()));
    }
  }
}
