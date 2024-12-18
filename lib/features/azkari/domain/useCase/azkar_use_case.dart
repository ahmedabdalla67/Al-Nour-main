import 'package:dartz/dartz.dart';
import 'package:mesk/core/errors/failure.dart';
import 'package:mesk/features/azkari/domain/Entities/sub_entities/category_group_entity.dart';
import 'package:mesk/features/azkari/domain/repository/azkar_repo.dart';

class AzkarUseCase{
  final AzkarRepo azkarRepo;

  AzkarUseCase({required this.azkarRepo});

  Future<Either<Failure, List<CategoryGroupEntity>>> call(){
    return azkarRepo.getAzkarData();
  }
}