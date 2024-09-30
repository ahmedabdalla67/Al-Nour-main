import 'package:dartz/dartz.dart';
import 'package:mesk/core/errors/failure.dart';
import 'package:mesk/features/surah_details/domain/entities/surah_list_entity.dart';

abstract class SurahListRepo{
  Future<Either<Failure, List<SurahListEntity>>> getListSurahInfo();
}