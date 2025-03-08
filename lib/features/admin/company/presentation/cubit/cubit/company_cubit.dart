import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workify/core/storage/cache_helper.dart';
import 'package:workify/core/utils/constants/app_strings.dart';
import 'package:workify/features/admin/company/data/models/company_model.dart';

part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit() : super(CompanyInitial());
  final String id = jsonDecode(AppSharedPreferences.sharedPreferences
          .getString(AppStrings.userModelKey) ??
      "")['id'];
  Future<void> loadCompanySetup() async {
    emit(LoadingLoadCompanyState());
    try {
      final result = await FirebaseFirestore.instance
          .collection("companies")
          .doc(id)
          .get();

      if (result.exists) {
        emit(SuccessLoadCompanyState(
            companyModel: CompanyModel.fromJson(result.data() ?? {})));
      } else {
        emit(SuccessLoadCompanyState());
      }
    } on FirebaseException catch (e) {
      emit(FailureLoadCompanyState(errMessage: e.toString()));
    }
  }
}
