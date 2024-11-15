import 'package:dartz/dartz.dart';
import 'package:mesk/core/errors/failure.dart';
import 'package:mesk/features/hadith/domain_layer/entities/hadith_entity.dart';

abstract class HadithRepo {
  Future<Either<Failure, List<HadithEntity>>> getGitHubHadithFiles();
  Future<Either<Failure, HadithEntity>> downloadFile(String fileName);
  Future<Either<Failure, HadithEntity>> getFileContent(String fileName);
}
