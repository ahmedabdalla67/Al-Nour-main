import 'package:dartz/dartz.dart';
import 'package:mesk/core/errors/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}

class NoParam {}

// use case with two parameter
abstract class TwoParamUseCase<Type, FirstParam, SecondParam> {
  Future<Either<Failure, Type>> call(
      {required FirstParam firstParam, required SecondParam secondParam});
}
