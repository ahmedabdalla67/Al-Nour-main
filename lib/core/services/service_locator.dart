import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:mesk/core/connectioin/network_info.dart';
import 'package:mesk/core/database/cache/cache_helper.dart';
import 'package:mesk/core/utils/app_data.dart';
import 'package:mesk/features/home/data/data_sources/home_local_data_source.dart';
import 'package:mesk/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:mesk/features/home/data/repository/home_repo_impl.dart';
import 'package:mesk/features/home/domain/useCases/home_data_use_case.dart';
import 'package:mesk/features/surah_details/data/data_sources/local_data_sourse.dart';
import 'package:mesk/features/surah_details/data/repository/surah_list_repo_imp.dart';
import 'package:mesk/features/surah_details/domain/useCase/surah_list_use_case.dart';

final getIT = GetIt.instance;
void setupServiceLocator() {
  getIT.registerSingleton<CacheHelper>(CacheHelper());

  getIT.registerSingleton<AppData>(AppData());

  getIT.registerSingleton<HomeDataUseCase>(
    HomeDataUseCase(
      homeRepo: HomeRepoImpl(
        remoteDataSource: HomeRemoteDataSource(appData: AppData()),
        localDataSource: HomeLocalDataSource(cache: getIT<CacheHelper>()),
        networkInfo: NetworkInfoImp(
          DataConnectionChecker(),
        ),
      ),
    ),
  );

  getIT.registerLazySingleton<SurahListUseCase>(() => SurahListUseCase(
      surahListRepo: SurahListRepoImp(
        localDataSourse: LocalDataSourse()
      )
      )
      );
}
