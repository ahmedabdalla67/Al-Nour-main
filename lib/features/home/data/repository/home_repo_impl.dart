import 'package:dartz/dartz.dart';
import 'package:mesk/core/connectioin/network_info.dart';
import 'package:mesk/core/errors/exceptions.dart';
import 'package:mesk/core/errors/failure.dart';
import 'package:mesk/core/params/home_params.dart';
import 'package:mesk/features/home/data/data_sources/home_local_data_source.dart';
import 'package:mesk/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:mesk/features/home/domain/entities/home_entity.dart';
import 'package:mesk/features/home/domain/repository/home_repo.dart';

//! Repository is the bridge between domain layer and data layer
//! 1- check the internet to choose which data i will call from cache or Api
//! 2- after calling data i receive data as a model in data source and convert it to entity in domain layer

class HomeRepoImpl extends HomeRepo {
  final NetworkInfo networkInfo;
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepoImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<HomeEntity, Failure>> getHomeData(
      {required RandomVerseParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteData = remoteDataSource.getRandomSurah(params);
        localDataSource.cacheHome(remoteData);
        return left(remoteData);
      } on ServerException catch (e) {
        return right(Failure(errorMessage: e.errorModel.errMessage));
      }
    } else {
      try {
        final localData = await localDataSource.getLastHomeData();
        return left(localData);
      } on CacheException catch (e) {
        return right(Failure(errorMessage: e.errorMessage));
      }
    }
  }
}
