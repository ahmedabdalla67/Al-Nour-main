import 'package:dartz/dartz.dart';
import 'package:mesk/core/errors/exceptions.dart';
import 'package:mesk/core/errors/failure.dart';
import 'package:mesk/features/azkari/data/data_sources/local_data_source.dart';
import 'package:mesk/features/azkari/domain/Entities/sub_entities/category_group_entity.dart';
import 'package:mesk/features/azkari/domain/repository/azkar_repo.dart';

class AzkarRepoImpl extends AzkarRepo{
  final LocalDataSource localDataSource;

  AzkarRepoImpl({required this.localDataSource});
  @override
  Future<Either<Failure, List<CategoryGroupEntity>>> getAzkarData() async{
    try {
  final azkarModel = await localDataSource.getAzkarData();
  final azkarList = azkarModel.map((data)=>data.toEntity()).toList();
  
  return right(azkarList);
} on ServerException catch (e) {
  return left(Failure(errorMessage: e.errorModel.errMessage));
}
  }
}