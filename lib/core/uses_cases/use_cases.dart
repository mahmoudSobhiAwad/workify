import 'package:dartz/dartz.dart';
import 'package:workify/core/error/firebase_failures/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<FirebaseFailure, Type>> call(Params params);
}
