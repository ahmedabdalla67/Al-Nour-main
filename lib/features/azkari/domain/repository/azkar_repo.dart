import 'package:dartz/dartz.dart';
import 'package:mesk/core/errors/failure.dart';
import 'package:mesk/features/azkari/domain/Entities/azkar_entity.dart';

abstract class AzkarRepo{
  Future<Either<Failure, List<AzkarEntity>>> getAzkarData();
}