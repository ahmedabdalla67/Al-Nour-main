import 'package:dartz/dartz.dart';
import 'package:mesk/core/errors/failure.dart';
import 'package:mesk/features/hadith/domain_layer/entities/hadith_entity.dart';
import 'package:mesk/features/hadith/domain_layer/repository/hadith_repo.dart';

class GetHadithFilesUseCase {
  final HadithRepo hadithRepo;

  GetHadithFilesUseCase({required this.hadithRepo});

  Future<Either<Failure, List<HadithEntity>>> call(String fileName) async {
    return await hadithRepo.getHadiths(fileName);
  }
}
