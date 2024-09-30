import 'package:dartz/dartz.dart';
import 'package:mesk/core/errors/failure.dart';
import 'package:mesk/features/surah_details/domain/entities/surah_list_entity.dart';
import 'package:mesk/features/surah_details/domain/repository/surah_list_repo.dart';

class SurahListUseCase{
 final SurahListRepo surahListRepo;

  SurahListUseCase({required this.surahListRepo});
  Future<Either<Failure, List<SurahListEntity>>> call(){
    return surahListRepo.getListSurahInfo();
  } 
}