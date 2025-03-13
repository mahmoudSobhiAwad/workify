import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:workify/features/admin/home/data/repositories/home_repo_imp.dart';
import 'package:workify/features/employee/finger_print/data/models/movement_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final HomeRepoImp repo = HomeRepoImp();
  List<MovementModel> movements = [];
  Future<void> getMovements(String date) async {
    movements = await repo.getMovements(date);
    emit(LoadMovements());
  }
}
