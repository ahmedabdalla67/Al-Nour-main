import 'package:dartz/dartz.dart';
import 'package:mesk/core/errors/exceptions.dart';
import 'package:mesk/core/errors/failure.dart';
import 'package:mesk/features/surah_details/data/data_sources/local_data_sourse.dart';
import 'package:mesk/features/surah_details/domain/entities/surah_list_entity.dart';
import 'package:mesk/features/surah_details/domain/repository/surah_list_repo.dart';

class SurahListRepoImp extends SurahListRepo{
  final LocalDataSourse localDataSourse;

  SurahListRepoImp({required this.localDataSourse});
  @override
  Future<Either<Failure, List<SurahListEntity>>> getListSurahInfo() async{
    try {
  final modelList = await localDataSourse.getSurahInfoDataData();
  final dataList = modelList.map((model)=> model.toEntity()).toList();
  return right(dataList);
} on ServerException catch (e) {
  return left(Failure(errorMessage: e.errorModel.errMessage));
}
  }

}