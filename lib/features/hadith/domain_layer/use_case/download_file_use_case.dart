import 'package:dartz/dartz.dart';
import 'package:mesk/core/errors/failure.dart';
import 'package:mesk/features/hadith/domain_layer/entities/hadith_entity.dart';
import 'package:mesk/features/hadith/domain_layer/repository/hadith_repo.dart';

class DownloadFileUseCase {
  final HadithRepo hadithRepo;

  DownloadFileUseCase({required this.hadithRepo});

  Future<Either<Failure, void>> call(
      String fileName, List<HadithEntity> content) async {
    print('DownloadFileUseCase__');
    return await hadithRepo.cacheHadith(fileName, content);
  }
}
