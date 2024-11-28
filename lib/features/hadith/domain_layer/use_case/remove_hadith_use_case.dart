import 'package:dartz/dartz.dart';
import 'package:mesk/core/errors/failure.dart';
import 'package:mesk/features/hadith/domain_layer/repository/hadith_repo.dart';

class RemoveHadith {
  final HadithRepo repository;

  RemoveHadith(this.repository);

  Future<Either<Failure, void>> call(String fileName) async {
    return await repository.removeHadith(fileName);
  }
}
