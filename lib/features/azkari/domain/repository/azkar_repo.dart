import 'package:dartz/dartz.dart';
import 'package:mesk/core/errors/failure.dart';
import 'package:mesk/features/azkari/domain/Entities/sub_entities/category_group_entity.dart';

abstract class AzkarRepo{
  Future<Either<Failure, List<CategoryGroupEntity>>> getAzkarData();
}