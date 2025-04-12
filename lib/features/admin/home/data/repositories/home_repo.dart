import 'package:dartz/dartz.dart';
import 'package:workify/core/error/firebase_failures/failure.dart';
import 'package:workify/features/employee/finger_print/data/models/movement_model.dart';

abstract class HomeRepo {
  Future<Either<FirebaseFailure, List<MovementModel>>> getMovements(
      {required String date, required String companyId});
  Future<Either<FirebaseFailure, int>> loadAllEmpluyeesCounter(
      {required String companyId});
}
