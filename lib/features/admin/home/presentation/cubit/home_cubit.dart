import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';
import 'package:workify/core/storage/cache_helper.dart';
import 'package:workify/core/utils/constants/app_strings.dart';
import 'package:workify/features/admin/home/data/repositories/home_repo_imp.dart';
import 'package:workify/features/employee/finger_print/data/models/movement_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final String companyId = jsonDecode(
      AppSharedPreferences.getString(key: AppStrings.userModelKey)!)['id'];
  final HomeRepoImp repo = HomeRepoImp();
  List<MovementModel> movements = [];
  Future<void> getMovements(
    DateTime date,
  ) async {
    emit(LoadingLoadMovements());

    final String formattedDate = DateFormat('d MMM yyyy').format(date);
    final result =
        await repo.getMovements(date: formattedDate, companyId: companyId);
    result.fold((failure) {
      emit(FailureLoadMovements(errMessage: failure.message));
    }, (data) {
      emit(SuccessLoadMovements(movements: data));
    });
  }
}
