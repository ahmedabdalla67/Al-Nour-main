import 'package:dartz/dartz.dart';
import 'package:mesk/core/errors/failure.dart';
import 'package:mesk/features/hadith/domain_layer/entities/hadith_entity.dart';

abstract class HadithRepo {
  Future<Either<Failure, List<HadithEntity>>> getHadiths(String fileName);
  Future<Either<Failure, void>> cacheHadith(String fileName, String content);
  Future<Either<Failure, void>> removeHadith(String fileName);
  Future<Either<Failure, bool>> isHadithDownloaded(String fileName);
}
