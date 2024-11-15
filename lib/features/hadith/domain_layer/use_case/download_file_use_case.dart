import 'package:dartz/dartz.dart';
import 'package:mesk/core/errors/failure.dart';
import 'package:mesk/features/hadith/domain_layer/entities/hadith_entity.dart';
import 'package:mesk/features/hadith/domain_layer/repository/hadith_repo.dart';
import 'package:mesk/features/hadith/domain_layer/use_case/use_case.dart';

class DownloadFileUseCase extends UseCase<HadithEntity, String> {
  final HadithRepo hadithRepo;

  DownloadFileUseCase({required this.hadithRepo});

  @override
  Future<Either<Failure, HadithEntity>> call(String param) async {
    return await hadithRepo.downloadFile(param);
  }
}
