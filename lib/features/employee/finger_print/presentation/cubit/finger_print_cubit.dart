import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:workify/core/storage/cache_helper.dart';
import 'package:workify/core/utils/constants/app_strings.dart';
import 'package:workify/features/employee/finger_print/data/models/movement_model.dart';

part 'finger_print_state.dart';

class FingerPrintCubit extends Cubit<FingerPrintState> {
  FingerPrintCubit() : super(FingerPrintInitial());
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final String fullName =
      jsonDecode(AppSharedPreferences.getString(key: AppStrings.userModelKey)!)[
          'fullName'];
  final String userName =
      jsonDecode(AppSharedPreferences.getString(key: AppStrings.userModelKey)!)[
          'userName'];
  final String companyId =
      jsonDecode(AppSharedPreferences.getString(key: AppStrings.userModelKey)!)[
          'companyId'];
  final LatLng companyLocation = LatLng(
      jsonDecode(AppSharedPreferences.getString(key: AppStrings.userModelKey)!)[
          'companyLocation']['lat'] as double,
      jsonDecode(AppSharedPreferences.getString(key: AppStrings.userModelKey)!)[
          'companyLocation']['long'] as double);
  Future<void> getUserLocation() async {
    emit(LoadingGetUserLocationState());
    var status = await Permission.location.request();
    if (status.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition();
        emit(SuccessGetUserLocationState(position: position));
      } catch (e) {
        emit(FailureGetUserLocationState(errMessage: e.toString()));
      }
    } else {
      emit(FailureGetUserLocationState(
          errMessage: "You deneid the Access To Your Location"));
    }
  }

  Future<void> loadDayMovements() async {
    String formattedDay = DateFormat('d MMM yyyy').format(DateTime.now());
    try {
      emit(LoadingGetMovementOfDay());
      final result = await _fireStore
          .collection("compaines")
          .doc(companyId)
          .collection("movements")
          .doc(formattedDay)
          .collection("employeeMovement")
          .doc(userName)
          .get();
      if (result.exists) {
        final MovementModel model = result.data() != null
            ? MovementModel.fromJson(result.data()!)
            : MovementModel(fullName: fullName);
        emit(SuccessGetMovementOfDay(model: model));
      } else {
        emit(SuccessGetMovementOfDay(model: MovementModel(fullName: fullName)));
      }
    } catch (e) {
      emit(FailureGetMovementOfDay(errMessage: e.toString()));
    }
  }

  Future<void> makeMovement(MovementModel movementModel) async {
    try {
      emit(LoadingAddMovementState());
      String formattedDay = DateFormat('d MMM yyyy').format(DateTime.now());
      await _fireStore
          .collection("compaines")
          .doc(companyId)
          .collection("movements")
          .doc(formattedDay)
          .collection("employeeMovement")
          .doc(userName)
          .set(movementModel.toMap());
      emit(SuccessAddMovementState(movementModel: movementModel));
    } catch (e) {
      emit(FailureGetMovementOfDay(errMessage: e.toString()));
    }
  }

  // Future<void> checkAuth() async {}
}
