import 'package:dartz/dartz.dart';
import 'package:mesk/core/errors/failure.dart';
import 'package:mesk/features/home/domain/entities/home_entity.dart';
import 'package:mesk/features/home/domain/repository/home_repo.dart';

class HomeDataUseCase{
  final HomeRepo homeRepo;

  HomeDataUseCase({required this.homeRepo});

 Future<Either<HomeEntity, Failure>> call(){
   return homeRepo.getHomeData();
  }
}