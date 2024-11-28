import 'package:dartz/dartz.dart';
import 'package:mesk/core/errors/exceptions.dart';
import 'package:mesk/core/errors/failure.dart';
import 'package:mesk/features/hadith/data_layer/data_source/local_data_source.dart';
import 'package:mesk/features/hadith/data_layer/data_source/remote_data_source.dart';
import 'package:mesk/features/hadith/domain_layer/entities/hadith_entity.dart';
import 'package:mesk/features/hadith/domain_layer/repository/hadith_repo.dart';

class HadithRepoImpl extends HadithRepo {
  final HadithLocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  HadithRepoImpl(
      {required this.localDataSource, required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> cacheHadith(
      String fileName, String content) async {
    try {
      await localDataSource.cacheHadith(fileName, content);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(Failure(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<HadithEntity>>> getHadiths(
      String fileName) async {
    try {
      if (await localDataSource.isHadithDownloaded(fileName)) {
        final localHadithsModel = await localDataSource.getHadiths(fileName);
        final localHadiths =
            localHadithsModel.map((json) => json.toEntity()).toList();
        return Right(localHadiths);
      }
      final remoteHadithsModel =
          await remoteDataSource.getHadithFiles(fileName);
      final remoteHadith =
          remoteHadithsModel.map((json) => json.toEntity()).toList();
      return Right(remoteHadith);
    } on ServerException catch (e) {
      return Left(Failure(errorMessage: e.errorModel.errMessage));
    } on CacheException catch (e) {
      return Left(Failure(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, bool>> isHadithDownloaded(String fileName) async {
    try {
      final isDownloaded = await localDataSource.isHadithDownloaded(fileName);
      return Right(isDownloaded);
    } on CacheException catch (e) {
      return Left(Failure(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> removeHadith(String fileName) async {
    try {
      await localDataSource.removeHadith(fileName);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(Failure(errorMessage: e.errorMessage));
    }
  }
}
