import 'package:dartz/dartz.dart';
import 'package:mesk/core/errors/failure.dart';
import 'package:mesk/features/home/domain/entities/home_entity.dart';

abstract class HomeRepo{
  Future<Either<HomeEntity,Failure>> getHomeData();
}