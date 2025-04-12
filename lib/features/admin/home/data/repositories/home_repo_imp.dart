import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:workify/core/dependancy_injection/service_locator.dart';
import 'package:workify/core/error/firebase_failures/failure.dart';
import 'package:workify/features/employee/finger_print/data/models/movement_model.dart';
import 'home_repo.dart';

class HomeRepoImp extends HomeRepo {
  final firestore = getIt.get<FirebaseFirestore>();

  @override
  Future<Either<FirebaseFailure, List<MovementModel>>> getMovements(
      {required String date, required String companyId}) async {
    final List<MovementModel> movements = [];
    try {
      final result = await firestore
          .collection('companies')
          .doc(companyId)
          .collection('movements')
          .doc(date)
          .collection('employeeMovement')
          .get();
      for (var element in result.docs) {
        movements.add(MovementModel.fromJson(element.data()));
      }
      return right(movements);
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<FirebaseFailure, int>> loadAllEmpluyeesCounter(
      {required String companyId}) async {
    try {
      final result = await firestore
          .collection('companies')
          .doc(companyId)
          .collection('employees')
          .get();
      return right(result.docs.length);
    } catch (e) {
      return left(FirebaseFailure(e.toString()));
    }
  }
}
