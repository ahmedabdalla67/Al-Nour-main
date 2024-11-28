import 'package:dartz/dartz.dart';
import 'package:mesk/core/errors/failure.dart';
import 'package:mesk/features/hadith/domain_layer/repository/hadith_repo.dart';

class CheckHadithStatus {
  final HadithRepo repository;

  CheckHadithStatus(this.repository);

  Future<Either<Failure, bool>> call(String fileName) async {
    return await repository.isHadithDownloaded(fileName);
  }
}
