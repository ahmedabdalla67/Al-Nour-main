import 'package:dartz/dartz.dart';
import 'package:mesk/core/errors/failure.dart';
import 'package:mesk/features/azkari/domain/Entities/azkar_entity.dart';
import 'package:mesk/features/azkari/domain/repository/azkar_repo.dart';

class AzkarUseCase{
  final AzkarRepo azkarRepo;

  AzkarUseCase({required this.azkarRepo});

  Future<Either<Failure, List<AzkarEntity>>> call(){
    return azkarRepo.getAzkarData();
  }
}