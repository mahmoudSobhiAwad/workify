import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workify/features/employee/finger_print/data/models/movement_model.dart';
import 'home_repo.dart';

class HomeRepoImp extends HomeRepo {
  final firestore = FirebaseFirestore.instance;
  final List<MovementModel> movements = [];
  @override
  Future<List<MovementModel>> getMovements(String date) async {
    await firestore
        .collection('companies')
        .doc('kbyFml3acbdgqccaNq68EQjzPyG2')
        .collection('movements')
        .doc(date.toString())
        .collection('employeeMovement')
        .get()
        .then((value) {
      for (var element in value.docs) {
        final movement = MovementModel.fromJson(element.data());
        movements.add(movement);
      }
    });
    return movements;
  }
}
