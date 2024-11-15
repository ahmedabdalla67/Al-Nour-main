import 'package:dartz/dartz.dart';
import 'package:mesk/core/errors/failure.dart';
import 'package:mesk/features/hadith/domain_layer/entities/hadith_entity.dart';
import 'package:mesk/features/hadith/domain_layer/repository/hadith_repo.dart';
import 'package:mesk/features/hadith/domain_layer/use_case/use_case.dart';

class GetHadithFilesUseCase extends UseCase<List<HadithEntity>, NoParam> {
  final HadithRepo hadithRepo;

  GetHadithFilesUseCase({required this.hadithRepo});
  @override
  Future<Either<Failure, List<HadithEntity>>> call(NoParam param) async {
    return await hadithRepo.getGitHubHadithFiles();
  }
}
