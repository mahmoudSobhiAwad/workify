import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_employee_state.dart';

class HomeEmployeeCubit extends Cubit<HomeEmployeeState> {
  HomeEmployeeCubit() : super(HomeEmployeeInitial());
}
